//
//  Calend_class.swift
//  Mamen
//
//  Created by Chester Zhao on 3/17/23.
//

import Foundation
import SwiftUI

struct Calendar_class {
    var date: Int
    var name: String
    var place: String
    var begin: String
    var over: String
    var color: Color
    
    init(date: Int, name: String, place: String, begin: String, over: String, color: Color) {
        self.date = date
        self.name = name
        self.place = place
        self.begin = begin
        self.over = over
        self.color = color
    }
}
