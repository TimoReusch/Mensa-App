//
//  ContentView.swift
//  Mensa
//
//  Created by Timo Reusch on 25.08.22.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 1
    
    @EnvironmentObject private var globalStore: GlobalStore
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CanteensView()
                .tabItem {
                    Label("Mensen", systemImage: "fork.knife")
                }
                .tag(1)
            CafeteriasView()
                .tabItem {
                    Label("Cafeterien", systemImage: "cup.and.saucer.fill")
                }
                .tag(2)
            FavoriteView()
                .tabItem {
                    Label("Lieblingsmensa", systemImage: "heart.fill")
                }
                .tag(3)
            SettingsView()
                .tabItem {
                    Label("Einstellungen", systemImage: "gear")
                }
                .tag(4)
        }
        .accentColor(.red)
        .onChange(of: selectedTab){ newValue in
            globalStore.showDetailView = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
