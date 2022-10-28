//
//  Settings.swift
//  Mensa
//
//  Created by Timo Reusch on 01.09.22.
//

import Foundation

enum Price: String, CaseIterable, Identifiable {
    case student, employee, guest
    var id: Self { self }
}

enum Location: String, CaseIterable, Identifiable {
    case wuerzburg, schweinfurt, bamberg, aschaffenburg
    var id: Self { self }
}
