//
//  HomeView.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 08/04/21.
//

import SwiftUI

struct HomeView: View {

  @ObservedObject private var locationManager = LocationManager()

    var body: some View {
      VStack {
        if locationManager.placemark?.locality != nil {
          Text(locationManager.placemark!.locality!)
        }else{
          Text("Home View")
        }
      }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
      .background(Color.white)
      .onAppear(perform: {
        if locationManager.isLocationEnabled {
          locationManager.requestAuthorization()
        }
      })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
