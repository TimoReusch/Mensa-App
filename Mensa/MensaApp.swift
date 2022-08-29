//
//  MensaApp.swift
//  Mensa
//
//  Created by Timo Reusch on 25.08.22.
//

import SwiftUI

@main
struct MensaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(GlobalStore())
        }
    }
}
