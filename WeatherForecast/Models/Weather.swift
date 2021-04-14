//
//  Weather.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 13/04/21.
//

import Foundation

struct WeatherResponse:Codable {
  var current:Weather
  var hourly:[Weather]
  var daily:[DailyWeather]

  static func empty() -> WeatherResponse {
    return WeatherResponse(current:Weather(), hourly: [Weather](repeating: Weather(), count:  23), daily: [DailyWeather](repeating: DailyWeather(), count: 8))
  }

}

struct Weather:Codable,Identifiable {
  var dt:Int = 0
  var temp:Double = 0.0
  var feels_like:Double = 0.0
  var pressure:Int = 0
  var humidity:Int = 0
  var dew_point:Double = 0.0
  var clouds:Int = 0
  var wind_speed:Double = 0.0
  var wind_deg:Int = 0
  var weather:[WeatherDetail] = [WeatherDetail]()
}

extension Weather {
  var id:UUID {
    return UUID()
  }
}

struct WeatherDetail:Codable {
  var main:String = ""
  var description:String = ""
  var icon:String = ""
}

struct DailyWeather:Codable,Identifiable {
  var dt:Int = 0
  var temp:Temperature = Temperature()
  var weather:[WeatherDetail] = [WeatherDetail]()
}

extension DailyWeather {
  var id:UUID {
    return UUID()
  }
}

struct Temperature:Codable {
  var min:Double = 0.0
  var max:Double = 0.0
}


