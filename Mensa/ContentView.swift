//
//  ContentView.swift
//  Mensa
//
//  Created by Timo Reusch on 25.08.22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var globalStore: GlobalStore
    
    var body: some View {
        FeedView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
