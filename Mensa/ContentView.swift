//
//  ContentView.swift
//  Mensa
//
//  Created by Timo Reusch on 25.08.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CanteensView()
                .tabItem {
                    Label("Mensen", systemImage: "fork.knife")
                }
            CafeteriasView()
                .tabItem {
                    Label("Cafeterien", systemImage: "cup.and.saucer.fill")
                }
            FavoriteView()
                .tabItem {
                    Label("Lieblingsmensa", systemImage: "heart.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Einstellungen", systemImage: "gear")
                }
        }.accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
