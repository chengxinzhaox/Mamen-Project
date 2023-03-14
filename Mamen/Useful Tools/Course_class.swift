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
    var location: String
    
    var teacher_name: String
    var teacher_image: String
    var teacher_email: String
    var teacher_workTime: String
    var teacher_office: String
    var teacher_office_location: String
    
    var slected: Bool
    var descrip: String
    
    
    init(name: String, image: String, type: String, location: String, teacher_name: String, teacher_image: String, teacher_emial: String, teacher_workTime:String, teacher_office: String, teacher_office_location: String, descrip: String, slected: Bool) {
        
        self.name = name
        self.image = image
        self.type = type
        self.location = location
        
        self.teacher_name = teacher_name
        self.teacher_image = teacher_image
        self.teacher_email = teacher_emial
        self.teacher_workTime = teacher_workTime
        self.teacher_office = teacher_office
        self.teacher_office_location = teacher_office_location
        
        
        
        self.descrip = descrip
        self.slected = slected
        
        
    }
    
//    init(){
//        self.init(name: "", image: "", type: "", teacher: "", descrip: "", slected: false)
//    }
    
}

