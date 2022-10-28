//
//  Utils.swift
//  Mensa
//
//  Created by Timo Reusch on 09.10.22.
//

import Foundation
import SwiftUI

let apiBase = "http://127.0.0.1:8080/"

func splitName(name: String) -> [String]{
    /// Example: Mensateria Campus Hubland Nord Würzburg

    // Split string at spaces and take the first element
    /// Example: Mensateria
    let components = name.components(separatedBy: " ")
    let type: String = components[0]
    
    // Truncate the start
    let rest = name.dropFirst(type.count + 1)
    
    return [type, String(rest)]
}

func todaysOpeningHours(openingHours: [OpeningHoursItem]) -> Text{
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "de-DE")
    // We only want the weekday
    dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
    let weekday = dateFormatter.string(from: Date())
    for item in openingHours {
        if(item.weekday == weekday){
            if(item.isOpened == false){
                break
            }
            return Text("\(Image(systemName: "clock"))  \(item.opensAt) - \(item.closesAt) Uhr\nEssensausgabe bis \(item.getFoodTill) Uhr")
        }
    }
    return Text("Geschlossen")
}
