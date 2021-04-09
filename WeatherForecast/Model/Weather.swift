//
//  WeatherVM.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 09/04/21.
//

import Foundation

public struct Weather {
  let city:String
  let temperature:Double
  let description:String
  let iconName:String

  init(response:APIResponse) {
    city = response.name
    temperature = response.main.temp
    description = response.weather.first?.description ?? ""
    iconName    = response.weather.first?.iconName ?? ""
  }


}
