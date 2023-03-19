//
//  Course.swift
//  Mamen
//
//  Created by Chester Zhao on 3/6/23.
//

import Foundation
import Combine

class Course_class: ObservableObject{
    
    @Published var name: String
    @Published var image: String
    @Published var type: String
    @Published var location: String
    
    @Published var teacher_name: String
    @Published var teacher_image: String
    @Published var teacher_email: String
    @Published var teacher_workTime: String
    @Published var teacher_office: String
    @Published var teacher_office_location: String
    
    @Published var slected: Bool
    @Published var descrip: String
    
    
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
}

