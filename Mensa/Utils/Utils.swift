//
//  Utils.swift
//  Mensa
//
//  Created by Timo Reusch on 09.10.22.
//

import Foundation

func todaysOpeningHours(openingHours: OpeningHours) -> OpeningHoursItem{
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "de-DE")
    // We only want the weekday
    dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
    let weekday = dateFormatter.string(from: Date())
    
    switch weekday {
    case "Montag":
        return openingHours.monday
        
    case "Dienstag":
        return openingHours.tuesday
        
    case "Mittwoch":
        return openingHours.wednesday
        
    case "Donnerstag":
        return openingHours.thursday
        
    case "Freitag":
        return openingHours.friday
        
    default:
        return OpeningHoursItem(id: UUID(), opensAt: "", closesAt: "", getFoodTill: "", isOpen: false)
    }
}
