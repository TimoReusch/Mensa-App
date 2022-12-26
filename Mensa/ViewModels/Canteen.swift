//
//  Canteen.swift
//  Mensa
//
//  Created by Timo Reusch on 28.10.22.
//

import Foundation

struct Canteen: Identifiable, Hashable {
    var id: UUID
    var name: String
    var location: String
    var type: String
    var info: String
    var additionalInfo: String
    var address: String
    var description_de: String
    var hours_mon: [Any]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(address)
    }

    static func == (lhs: Canteen, rhs: Canteen) -> Bool {
        return lhs.address == rhs.address && lhs.type == rhs.type && lhs.name == rhs.name
    }
}
