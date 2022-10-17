//
//  CanteenItem.swift
//  Mensa
//
//  Created by Timo Reusch on 28.08.22.
//

import Foundation

struct CanteensResponse: Decodable {
    var data: [CanteenItem]
}

struct CanteenItem: Decodable {
    var id: Int
    var name: String
    var location: String
    var type: String
    var info: String
    var additionalInfo: String
    var openingHours: [OpeningHoursItem]
}

struct OpeningHoursItem: Decodable {
    var weekday: String
    var isOpened: Bool
    var opensAt: String
    var closesAt: String
    var getFoodTill: String
}



var dummyText = "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
