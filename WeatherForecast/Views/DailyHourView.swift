//
//  DailyHourView.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 14/04/21.
//

import SwiftUI

struct DailyHourView: View {

  @ObservedObject var cityVM:CityViewModel

    var body: some View {
      ForEach(cityVM.weather.daily) { (weather) in
        LazyVStack{
          dailyCell(weather: weather)
        }
      }
    }

  private func dailyCell(weather:DailyWeather) -> some View {
    HStack {
      Text(cityVM.getDayFor(timestamp: weather.dt).uppercased())
        .frame(width:50)
      Spacer()
      Text("\(cityVM.getTempFor(temp: weather.temp.max)) | \(cityVM.getTempFor(temp: weather.temp.min))")
        .frame(width:150)
      Spacer()
      cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
    }
    .foregroundColor(.white)
    .padding(.horizontal,40)
    .padding(.vertical,15)
    .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.4),Color.blue]), startPoint: .top, endPoint: .bottom))
    .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
    .shadow(color: Color.white.opacity(0.2), radius: 2, x: 2, y: 2)
    .cornerRadius(5.0)
  }
}

struct DailyHourView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
