//
//  WeatherViewModel.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 09/04/21.
//

import Foundation
import SwiftUI

public class WeatherViewModel: ObservableObject {
  @Published var cityName:String = "City Name"
  @Published var temperature:String = "--"
  @Published var weatherDescription:String = "--"
}
