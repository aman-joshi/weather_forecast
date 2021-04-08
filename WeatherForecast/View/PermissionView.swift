//
//  PermissionView.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 08/04/21.
//

import SwiftUI

struct PermissionView: View {

  @ObservedObject private var locationManager = LocationManager()

  var body: some View {
    if locationManager.isLocationEnabled {
      HomeView()
    }else {
      VStack {
        Spacer()
        Image(systemName: Constants.ImageName.location)
          .resizable()
          .foregroundColor(.white)
          .frame(width: 60, height: 60, alignment: .center)

        Text(Constants.Title.allowPermission)
          .foregroundColor(.white)
          .font(.title2)
          .bold()
          .padding()

        Text(Constants.Title.permissionDesc)
          .foregroundColor(.white)
          .font(.title3)
          .padding(.horizontal)
        
        Spacer()

        Button(action: {
          allowPermissions()
        }, label: {
          Text("ALLOW")
            .foregroundColor(.white)
            .font(.title2).bold()
        })
        .frame(width: UIScreen.main.bounds.width * 0.7, height: 50, alignment: .center)
        .background(Color.black)
        .cornerRadius(10.0)
        .padding(.bottom)
      }
      .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
      .background(Color.black.opacity(0.6))
      .edgesIgnoringSafeArea(.top)
    }
  }

  func allowPermissions() {
    self.locationManager.requestAuthorization()
  }
  
}

struct PermissionView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionView()
    }
}
