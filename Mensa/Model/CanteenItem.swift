//
//  CanteenItem.swift
//  Mensa
//
//  Created by Timo Reusch on 28.08.22.
//

import Foundation

struct CanteenItem: Identifiable {
    var id = UUID().uuidString
    var title: String
    var category: String
    var overlay: String
    var mensaImage: String
}

var canteens = [
    CanteenItem(title: "Hubland", category: "adf", overlay: "blahblah", mensaImage: "hubland-nord"),
    CanteenItem(title: "Hubland", category: "adf", overlay: "blahblah", mensaImage: "hubland-nord")
]

var dummyText = "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
