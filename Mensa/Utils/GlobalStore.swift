//
//  GlobalStore.swift
//  Mensa
//
//  Created by Timo Reusch on 29.08.22.
//

import Foundation

class GlobalStore: ObservableObject {
    @Published var selectedTab: Int = 1
}
