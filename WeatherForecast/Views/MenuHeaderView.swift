//
//  MenuHeaderView.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 13/04/21.
//

import SwiftUI

struct MenuHeaderView: View {

  @ObservedObject var cityVM = CityViewModel()

  @State private var searchTerm = "San Francisco"

  var body: some View {
    HStack{
      //Image(systemName: "magnifyingglass").foregroundColor(.white)
      
      TextField("", text: $searchTerm)
        .padding()

      Button(action: {
        cityVM.cityName = searchTerm
      }) {
        ZStack{
          RoundedRectangle(cornerRadius: 10)
            .fill(Color.blue)

          Image(systemName: "location.fill")
        }
      }
      .frame(width: 50, height: 50)
    }
    .foregroundColor(.white)
    .padding()
    .background(ZStack {
      RoundedRectangle(cornerRadius: 10)
        .fill(Color.blue.opacity(0.5))
    })
  }
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MenuHeaderView()
    }
}
