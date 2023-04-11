//
//  GlobalTestData.swift
//  Mensa
//
//  Created by Timo Reusch on 10.04.23.
//

import Foundation

struct TestMeals {
    let meal1: Meal = Meal(
        id: UUID(),
        date: "13.04.2023",
        pictureId: 1,
        name: "Ofenfrischer Schweinekammbraten in Biersoße",
        allergens: ["glutenhaltiges Getreide", "Soja", "Sellerie", "Senf", "Weizen", "Gerste", "Alkohol", "Schwein"],
        ingredients: "Schwein",
        priceEmployee: "3,10 €",
        priceStundent: "4,45 €",
        priceGuest: "5,40 €"
    )
    
    let meal2: Meal = Meal(
        id: UUID(),
        date: "13.04.2023",
        pictureId: 1,
        name: "Gemüsemaultaschen in Karotten Ingwersoße",
        allergens: ["mit Farbstoff", "glutenhaltiges Getreide", "Eier", "Milch (einschließlich Lactose)", "Sellerie", "Weizen", "Knoblauch"],
        ingredients: "Fleischlos",
        priceEmployee: "3,10 €",
        priceStundent: "4,45 €",
        priceGuest: "5,40 €"
    )
    
    let meal3: Meal = Meal(
        id: UUID(),
        date: "13.04.2023",
        pictureId: 1,
        name: "Mensa-Vital: Kichererbsen - Kokos - Korma mit Mandelreis",
        allergens: ["Schalenfrüchte", "Mandeln", "Knoblauch"],
        ingredients: "Vegan",
        priceEmployee: "2,60 €",
        priceStundent: "3,90 €",
        priceGuest: "4,85 €"
    )
}

struct TestMenuForOneDay {
    let threeMenu: [Meal] = [TestMeals().meal1, TestMeals().meal2, TestMeals().meal3]
}
