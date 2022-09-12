//
//  GlobalStore.swift
//  Mensa
//
//  Created by Timo Reusch on 29.08.22.
//

import Foundation

class GlobalStore: ObservableObject {
    // Canteens
    @Published var currentCanteen: CanteenItem?
    
    @Published var showDetailView: Bool = false
    
    // Detail Animation Properties
    @Published var animateView: Bool = false
    @Published var animateContent: Bool = false
    
    @Published var selectedTab: Int = 3
}
