//
//  OpeningHours.swift
//  Mensa
//
//  Created by Timo Reusch on 28.10.22.
//

import Foundation

struct OpeningHours: Identifiable {
    var id: UUID
    var weekday: String
    var opensAt: String
    var closesAt: String
    var getFoodTill: String
    var isOpen: Bool
}
