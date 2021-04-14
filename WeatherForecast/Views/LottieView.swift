//
//  LottieView.swift
//  WeatherForecast
//
//  Created by Mohd Maruf on 13/04/21.
//

import SwiftUI
import Lottie

struct LottieView:UIViewRepresentable {
  var name:String
  var loopMode:LottieLoopMode = .loop

  func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
    let view = UIView()
    return view
  }

  func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieView>) {
    uiView.subviews.forEach { $0.removeFromSuperview() }

    let animationView = AnimationView()
    uiView.addSubview(animationView)

    animationView.frame = CGRect(origin: animationView.frame.origin, size: CGSize(width: 100, height: 100))

    animationView.animation = Animation.named(name)
    animationView.contentMode = .scaleAspectFill
    animationView.loopMode = .loop
    animationView.play()
  }

}
