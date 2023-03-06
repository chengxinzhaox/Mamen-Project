//
//  Course.swift
//  Mamen
//
//  Created by Chester Zhao on 3/6/23.
//

import Foundation

struct Course_class{
    var name: String
    var image: String
    var type: String
    var teacher: String
    var slected: Bool
    
    init(name: String, image: String, type: String, teacher: String, slected: Bool) {
        self.name = name
        self.image = image
        self.type = type
        self.teacher = teacher
        self.slected = slected
    }
    
    init(){
        self.init(name: "", image: "", type: "", teacher: "", slected: false)
    }
    
}
