//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 08/04/21.
//

import SwiftUI
import CoreLocation


struct ContentView: View {

  @ObservedObject var cityVM = CityViewModel()
  
    var body: some View {
      ZStack(alignment:.bottom) {
        VStack {
          MenuHeaderView(cityVM:cityVM)
          ScrollView(showsIndicators:false) {
            CityView(cityVM:cityVM)
          }
        }.padding(.top,30)
      }
      .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3),Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
