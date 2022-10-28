//
//  Canteen.swift
//  Mensa
//
//  Created by Timo Reusch on 28.10.22.
//

import Foundation

struct Canteen: Identifiable {
    var id: UUID
    var name: String
    var location: String
    var type: String
    var info: String
    var additionalInfo: String
    var address: String
    var description_de: String
}
