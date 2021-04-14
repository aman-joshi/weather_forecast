//
//  API.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 13/04/21.
//

import Foundation

struct API {
  static let API_KEYS = "4f9f4d024725ad305fe8f8236562c422"
}

extension API {

  static let baseURLString = "https://api.openweathermap.org/data/2.5/"

  static func getUrlFor(lat:Double,lon:Double) -> URL? {
    guard let url = URL(string: "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(API_KEYS)&units=imperial") else { return nil }
    return url
  }

}
