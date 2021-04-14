//
//  CityNameView.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 13/04/21.
//

import SwiftUI

struct CityNameView: View {
  var city:String
  var date:String

    var body: some View {
      HStack{
        VStack(alignment: .center, spacing: 10){
          Text(city)
            .font(.title)
            .bold()
          Text(date)
        }.foregroundColor(.white)
      }
    }
}

struct CityNameView_Previews: PreviewProvider {
    static var previews: some View {
      CityNameView(city: "New york", date: "10-10-2021")
    }
}
