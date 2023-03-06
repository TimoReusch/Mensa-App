//
//  FeedViewModel.swift
//  Mensa
//
//  Created by Timo Reusch on 06.03.23.
//

import Foundation

func getTodaysDate() -> String{
    let today = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.YY"
    
    return formatter.string(from: today)
}
