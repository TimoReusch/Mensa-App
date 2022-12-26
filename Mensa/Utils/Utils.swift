//
//  Utils.swift
//  Mensa
//
//  Created by Timo Reusch on 09.10.22.
//

import Foundation
import SwiftUI

/*
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
*/
