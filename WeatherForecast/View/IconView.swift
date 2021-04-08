//
//  IconView.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 08/04/21.
//

import SwiftUI

struct IconView: View {

    var body: some View {
      VStack {
        Circle()
          .fill(
                  RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 15, endRadius: 100)
              )
          .frame(width: 100, height: 100, alignment: .center)

        Text("Weather Forecast")
          .font(.title)
          .bold()
          .foregroundColor(.white)
      }
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView()
    }
}
