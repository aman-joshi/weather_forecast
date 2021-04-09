//
//  LocationManager.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 08/04/21.
//

import Foundation
import Combine
import CoreLocation

class LocationManager: NSObject, ObservableObject {
  private let locationManager = CLLocationManager()
  private let geocoder = CLGeocoder()

  let objectWillChange = PassthroughSubject<Void,Never>()


  @Published var status:CLAuthorizationStatus? {
    willSet { objectWillChange.send() }
  }

  @Published var location:CLLocation? {
    willSet { objectWillChange.send() }
  }

  @Published var placemark: CLPlacemark? {
    willSet { objectWillChange.send() }
  }

  @Published var isLocationAuthorised:Bool = false {
    willSet { objectWillChange.send() }
  }

  override init() {
    super.init()
    self.locationManager.delegate = self
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    self.locationManager.activityType = .other
    self.locationManager.distanceFilter = 10.0
  }

  func requestAuthorization() {
    self.locationManager.requestAlwaysAuthorization()
  }

  private func geocode() {
      guard let location = self.location else { return }
      geocoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
        if error == nil {
          self.placemark = places?[0]
          print(self.placemark!.locality!)
        } else {
          self.placemark = nil
          print("Placemark not found")
        }
      })
    }

  private func updateAuthorizationStatus() {
    switch status {
    case .authorizedAlways,.authorizedWhenInUse:
      isLocationAuthorised = true
      break
    case .denied,.notDetermined,.restricted:
      isLocationAuthorised = false
      break

    default:
      break
    }
  }

}

extension LocationManager:CLLocationManagerDelegate {

  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    self.status = status
    updateAuthorizationStatus()
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    self.location = location
    self.geocode()
  }

}
