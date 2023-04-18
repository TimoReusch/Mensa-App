//
//  UnderlineModifier.swift
//  Mensa
//
//  Created by Timo Reusch on 27.12.22.
//

import SwiftUI

/// This modifier provides an animated underscore for the SegmentedControl.
struct UnderlineModifier: ViewModifier
{
    var selectedIndex: Int
    let frames: [CGRect]

    func body(content: Content) -> some View{
        content
            .background(
                Rectangle()
                    .fill(Color("logo_green"))
                    .frame(width: frames[selectedIndex].width, height: 2)
                    .offset(x: frames[selectedIndex].minX - frames[0].minX), alignment: .bottomLeading
            )
            .background(
                Rectangle()
                    .fill(Color("lightgray"))
                    .frame(height: 1), alignment: .bottomLeading
            )
            .animation(.default, value: selectedIndex)
    }
}
