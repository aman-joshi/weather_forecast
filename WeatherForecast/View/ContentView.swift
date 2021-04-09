//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 08/04/21.
//

import SwiftUI
import CoreLocation


struct ContentView: View {

  @State var dismissSplashScreen = false

    var body: some View {
      VStack {
        if dismissSplashScreen {
            WeatherView()
        }
        else{
          IconView()
        }
      }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
      .background(Color.black.opacity(0.6))
      .edgesIgnoringSafeArea(.top)
      .onAppear(perform: {
        changeView()
      })
    }

  func changeView() {
    Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (_) in
      self.dismissSplashScreen = true
    }
  }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
