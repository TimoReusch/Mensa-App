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

// Takes the canteen name in the format "Mensa Campus Hubland Nord" and converts it to "mensa_campus_hubland_nord".
func convertToSnakeCase(text: String) -> String{
    var result: String = ""
    
    for char in text.lowercased(){
        switch char{
        case "ä":
            result.append("ae")
            
        case "ö":
            result.append("oe")
            
        case "ü":
            result.append("ue")
            
        case " ":
            result.append("_")
            
        case "-":
            result.append("_")
            
        case "ß":
            result.append("ss")
        
        default:
            result.append(char)
        }
    }
    return result
}
