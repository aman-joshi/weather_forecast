//
//  HourlyView.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 14/04/21.
//

import SwiftUI

struct HourlyView: View {
  @ObservedObject var cityVM:CityViewModel

    var body: some View {

      ScrollView(.horizontal, showsIndicators:false) {
        HStack(spacing:20) {
          ForEach(cityVM.weather.hourly) { weather in
            let icon = cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
            let hour = cityVM.getTimeFor(timestamp: weather.dt)
            let temp = cityVM.getTempFor(temp: weather.temp)
            getHourlyView(hour: hour, image: icon, temp: temp)
          }
        }
      }
    }

  private func getHourlyView(hour:String, image:Image, temp:String) -> some View {
    VStack(spacing:20) {
      Text(hour)
      image.foregroundColor(.yellow)
      Text(temp)
    }
    .foregroundColor(.white)
    .padding()
    .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.4),Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
    .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
    .shadow(color: Color.white.opacity(0.2), radius: 2, x: 2, y: 2)
    .cornerRadius(5.0)
  }
}

struct HourlyView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
