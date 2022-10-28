//
//  LottieView.swift
//  Mensa
//
//  Created by Timo Reusch on 01.09.22.
//

import Foundation
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    typealias UIViewType = UIView
    var filename: String
    var loop: Bool
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let lottieAnimationView = LottieAnimationView(name: filename)
        lottieAnimationView.contentMode = .scaleAspectFit
        if(loop == true){
            lottieAnimationView.loopMode = .loop
        }
        lottieAnimationView.play()
        
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lottieAnimationView)
        
        NSLayoutConstraint.activate([
            lottieAnimationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            lottieAnimationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
