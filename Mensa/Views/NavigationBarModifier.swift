//
//  NavigationBarModifier.swift
//  Mensa
//
//  Created by Timo Reusch on 29.08.22.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    
    var backgroundColor: UIColor
    
    init(backgroundColor: UIColor) {
        // assign
        self.backgroundColor = backgroundColor
        
        // change appearance
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().barTintColor = backgroundColor
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    //VisualEffectView(effect: UIBlurEffect(style: .regular))
                    Color(backgroundColor)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
