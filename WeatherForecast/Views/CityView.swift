//
//  CityView.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 14/04/21.
//

import SwiftUI

struct CityView: View {
  @ObservedObject var cityVM:CityViewModel

  var body: some View {
    VStack{
      CityNameView(city: cityVM.cityName, date: cityVM.date).shadow(radius: 0)
      TodayWeatherView(cityVM: cityVM).padding(.horizontal)
      HourlyView(cityVM: cityVM)
      DailyHourView(cityVM: cityVM)

    }.padding(.bottom,30)
  }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
