//
//  Slected.swift
//  Mamen
//
//  Created by Chester Zhao on 3/6/23.
//

import SwiftUI
import SwiftyJSON

struct Slected: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var coursejson: responseBody = .init(result: 0, message: "", data: nil)
    
    @AppStorage("selectedCourse") var selectedCourse: [String] = []
    var body: some View {
        
            
            
                let json = JSON(coursejson.data ?? "")
                ZStack {
                    VStack {
                        List {
                            ForEach(0 ..< json.count, id: \.self) { index in
                                if self.selectedCourse.contains(json[index,"title"].stringValue) {
                                    ZStack(alignment: .leading) {
                                        NavigationLink(destination: CourseDetailView(course: Course_class(name: json[index, "title"].stringValue, image: json[index, "pic"].stringValue, type: json[index, "type"].stringValue, location: json[index, "room"].stringValue, teacher_name: json[index, "fullname"].stringValue, teacher_image: json[index, "name"].stringValue, teacher_emial: json[index, "email"].stringValue, teacher_workTime: json[index, "worktime"].stringValue, teacher_office: json[index, "workroom"].stringValue, teacher_office_location: json[index, "workroomdetail"].stringValue, descrip: json[index, "info"].stringValue, slected: false))) {
                                            EmptyView()
                                        }
                                        .opacity(0)
                                        
                                        BasicRow(course: Course_class(name: json[index, "title"].stringValue, image: json[index, "pic"].stringValue, type: json[index, "type"].stringValue, location: json[index, "room"].stringValue, teacher_name: json[index, "fullname"].stringValue, teacher_image: json[index, "name"].stringValue, teacher_emial: json[index, "email"].stringValue, teacher_workTime: json[index, "worktime"].stringValue, teacher_office: json[index, "workroom"].stringValue, teacher_office_location: json[index, "workroomdetail"].stringValue, descrip: json[index, "info"].stringValue, slected: false))
                                    }
                                }}
                            
                            .listRowSeparator(.hidden)
                        }
                        
                        .listStyle(.plain)
                    }.task {
                        r.GetAllCourses { result in
                            self.coursejson = result
                        }
                    }
                    
                }
               

        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("My Courses", displayMode:.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct Slected_Previews: PreviewProvider {
    static var previews: some View {
        Slected()
    }
}
