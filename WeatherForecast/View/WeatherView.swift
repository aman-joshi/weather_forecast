//
//  HomeView.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 08/04/21.
//

import SwiftUI

struct WeatherView: View {

  @ObservedObject private var locationManager = LocationManager()

    var body: some View {
      VStack {
        HStack{
          Button(action: {}) {
            Image(systemName: "text.alignleft").resizable().frame(width: 30, height: 30).foregroundColor(.white)
          }.padding(.top, 30)
          .padding(.leading, 10)
          Spacer()

          Text(locationManager.placemark?.locality != nil ? locationManager.placemark!.locality! : "")
            .foregroundColor(.white)
            .font(.title)
            .bold()
            .padding(.top,30)
            .padding(.leading, -20)
          Spacer()
        }

        Spacer()
      }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
      .background(LinearGradient(gradient: Gradient(colors: [.blue,.yellow]), startPoint: .top, endPoint: .bottom))
      
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
