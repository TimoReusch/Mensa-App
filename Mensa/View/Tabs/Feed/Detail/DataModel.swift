//
//  Canteen.swift
//  Mensa
//
//  Created by Timo Reusch on 28.10.22.
//

import Foundation

struct FoodProvider: Identifiable, Hashable {
    var id: UUID
    var firebaseId: Int
    var documentId: String
    var name: String
    var location: String
    var type: String
    var info: String
    var additionalInfo: String
    var address: String
    var description_de: String
    var openingHours: OpeningHours
    var menusCurrentWeek: Menus
    var menusNextWeek: Menus
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(address)
    }

    static func == (lhs: FoodProvider, rhs: FoodProvider) -> Bool {
        return lhs.address == rhs.address && lhs.type == rhs.type && lhs.name == rhs.name
    }
}


struct OpeningHours: Identifiable {
    var id: UUID
    let monday: OpeningHoursItem
    let tuesday: OpeningHoursItem
    let wednesday: OpeningHoursItem
    let thursday: OpeningHoursItem
    let friday: OpeningHoursItem
}


struct OpeningHoursItem: Identifiable {
    var id: UUID
    var opensAt: String
    var closesAt: String
    var getFoodTill: String
    var isOpen: Bool
}


struct Menus: Identifiable {
    var id: UUID
    let monday: [Meal]
    let tuesday: [Meal]
    let wednesday: [Meal]
    let thursday: [Meal]
    let friday: [Meal]
}

struct Meal: Identifiable {
    var id: UUID
    var date: String
    var pictureId: Int
    var name: String
    var allergens: [String]
    var ingredients: String
    var priceStudent: String
    var priceEmployee: String
    var priceGuest: String
}
