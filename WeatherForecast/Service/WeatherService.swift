//
//  WeatherService.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 09/04/21.
//

import CoreLocation
import Foundation

public final class WeatherService:NSObject {

  private let locationManager = CLLocationManager()
  private let API_KEYS = "4f9f4d024725ad305fe8f8236562c422"
  private var completionHandler:((Weather) -> Void)?

  public override init() {
    super.init()
    self.locationManager.delegate = self
  }

  func loadWeatherData(_ completionHandler:@escaping ((Weather) -> Void)) {
    self.completionHandler = completionHandler
    self.locationManager.requestWhenInUseAuthorization()
    self.locationManager.startUpdatingLocation()
  }

  private func makeDataRequest(forCoordinates coordinates:CLLocationCoordinate2D) {
    guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_KEYS)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }

    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil, let data = data else { return }
      if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
        self.completionHandler?(Weather(response: response))
      }
    }.resume()
  }

}

extension WeatherService:CLLocationManagerDelegate {

  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else { return }
    makeDataRequest(forCoordinates: location.coordinate)
  }

  public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Something went wrong - \(error.localizedDescription)")
  }

}


struct APIResponse:Decodable {
  let name:String
  let main:APIMain
  let weather:[APIWeather]
}

struct APIMain:Decodable {
  let temp:Double
}

struct APIWeather:Decodable {

  let description:String
  let iconName:String

  enum CodingKeys:String,CodingKey {
    case description, iconName = "main"
  }
}
