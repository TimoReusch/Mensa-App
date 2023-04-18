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
        priceStudent: "3,10 €",
        priceEmployee: "4,45 €",
        priceGuest: "5,40 €"
    )
    
    let meal2: Meal = Meal(
        id: UUID(),
        date: "13.04.2023",
        pictureId: 1,
        name: "Gemüsemaultaschen in Karotten Ingwersoße",
        allergens: ["mit Farbstoff", "glutenhaltiges Getreide", "Eier", "Milch (einschließlich Lactose)", "Sellerie", "Weizen", "Knoblauch"],
        ingredients: "Fleischlos",
        priceStudent: "3,10 €",
        priceEmployee: "4,45 €",
        priceGuest: "5,40 €"
    )
    
    let meal3: Meal = Meal(
        id: UUID(),
        date: "13.04.2023",
        pictureId: 1,
        name: "Mensa-Vital: Kichererbsen - Kokos - Korma mit Mandelreis",
        allergens: ["Schalenfrüchte", "Mandeln", "Knoblauch"],
        ingredients: "Vegan",
        priceStudent: "2,60 €",
        priceEmployee: "3,90 €",
        priceGuest: "4,85 €"
    )
    
    let meal4: Meal = Meal(
        id: UUID(),
        date: "14.04.2023",
        pictureId: 1,
        name: "Gebackenes Schollenfilet mit hausgemachtem Tomaten Olivendip",
        allergens: ["mit Farbstoff", "geschwärzt", "glutenhaltiges Getreide", "Eier", "Fische", "Milch (einschließlich Lactose)", "Sellerie", "Senf", "Weizen", "Gerste", "Knoblauch", "Fische"],
        ingredients: "Fisch",
        priceStudent: "3,35 €",
        priceEmployee: "4,70 €",
        priceGuest: "5,65 €"
    )
    
    
    let meal5: Meal = Meal(
        id: UUID(),
        date: "14.04.2023",
        pictureId: 1,
        name: "Mensa-Vital: Bohnen - Zucchini - Chili mit Vollkornreis",
        allergens: ["Knoblauch"],
        ingredients: "Vegan",
        priceStudent: "2,10 €",
        priceEmployee: "3,40 €",
        priceGuest: "4,35 €"
    )
    
    let meal6: Meal = Meal(
        id: UUID(),
        date: "14.04.2023",
        pictureId: 1,
        name: "Gebackene Kartoffeltaschen \"Kräuterfrischkäse\"",
        allergens: ["mit Farbstoff", "mit Antioxidationsmittel", "Milch (einschließlich Lactose)", "Senf", "Schwefelsulfid und Sulfite"],
        ingredients: "Fleischlos",
        priceStudent: "3,10 €",
        priceEmployee: "4,45 €",
        priceGuest: "5,40 €"
    )
}

struct TestMenuForOneDay {
    let threeMenu: [Meal] = [TestMeals().meal1, TestMeals().meal2, TestMeals().meal3]
}

struct TestFoodProviders {
    let foodProvider1: FoodProvider = FoodProvider(
        id: UUID(),
        firebaseId: 10,
        documentId: "mensateria_campus_hubland_nord_wuerzburg",
        name: "Campus Hubland Nord",
        location: "Würzburg",
        type: "Mensateria",
        info: "Bis auf weiteres geschlossen",
        additionalInfo: "Keine Abendmensa während der vorlesungsfreien Zeit",
        address: "Mensateria Campus Hubland Nord, Magdalene-Schoch-Str., 97074 Würzburg",
        description_de: "Die Mensateria mit 500 Innen- und 60 Balkonplätzen befindet sich im Obergeschoss des Gebäudes am westlichen Rand des Campus Nord am Hubland. Zur Südseite hin trägt die Mensateria einen Balkon, so dass ein Aufenthalt im Freien mit Blick auf den Hubland-Campus möglich ist.Ausgestattet ist die Mensateria mit einem modernen Speiseleitsystem sowie speziellen Angebotsvarianten.",
        openingHours: OpeningHours(
            id: UUID(),
            monday: OpeningHoursItem(id: UUID(), opensAt: "10:00", closesAt: "14:00", getFoodTill: "13:30", isOpen: true),
            tuesday: OpeningHoursItem(id: UUID(), opensAt: "10:00", closesAt: "14:00", getFoodTill: "13:30", isOpen: true),
            wednesday: OpeningHoursItem(id: UUID(), opensAt: "10:00", closesAt: "14:00", getFoodTill: "13:30", isOpen: true),
            thursday: OpeningHoursItem(id: UUID(), opensAt: "10:00", closesAt: "14:00", getFoodTill: "13:30", isOpen: true),
            friday: OpeningHoursItem(id: UUID(), opensAt: "", closesAt: "", getFoodTill: "", isOpen: false)
        ),
        menusCurrentWeek: Menus(
            id: UUID(),
            monday: [TestMeals().meal1, TestMeals().meal2, TestMeals().meal3],
            tuesday: [TestMeals().meal4, TestMeals().meal5, TestMeals().meal6],
            wednesday: [TestMeals().meal6, TestMeals().meal1, TestMeals().meal5],
            thursday: [TestMeals().meal3, TestMeals().meal4, TestMeals().meal2],
            friday: [TestMeals().meal5, TestMeals().meal6, TestMeals().meal1]
        ),
        menusNextWeek: Menus(
            id: UUID(),
            monday: [TestMeals().meal2, TestMeals().meal4, TestMeals().meal5],
            tuesday: [TestMeals().meal3, TestMeals().meal4, TestMeals().meal3],
            wednesday: [TestMeals().meal1, TestMeals().meal2, TestMeals().meal5],
            thursday: [TestMeals().meal5, TestMeals().meal1, TestMeals().meal3],
            friday: [TestMeals().meal6, TestMeals().meal2, TestMeals().meal4]
        )
    )
}
