//
//  Course.swift
//  Mamen
//
//  Created by Chester Zhao on 12/19/22.
//

import SwiftUI
import SwiftyJSON
struct Course: View {
    
    
    @State var showDetailView = false
    @State var showWebView = false
    @State var courseSlect = 0
    @State private var coursejson:responseBody=responseBody(result: 0, message: "", data: nil)
    @AppStorage("selectedCourse") var selectedCourse: [String] = []
    @State var now=0
    var body: some View {
        VStack {
            HStack {
                Text("Current Modules")
                    .font(.custom("AirbnbCereal_W_Bd", size: 25))
                    .foregroundColor(Color("main-green"))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
            .padding(.top, 20)
            .task {
                r.GetAllCourses { result in
                    self.coursejson=result
                }
            }
            let json=JSON(self.coursejson.data ?? "")
            ZStack {
                
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        ZStack {
                            
                            HStack {
                               

                                ForEach(0 ..< json.count,id:\.self) { item in
                                    if self.selectedCourse.contains(json[item,"title"].stringValue){
                                        ZStack {
                                            Course_card(image: json[item,"pic"].stringValue, name: json[item,"title"].stringValue, emoji: "🧑🏻‍💻")
                                                .onTapGesture {
                                                    courseSlect = item
                                                    TapticEngine.impact.feedback(.medium)
                                                    now=courseSlect
                                                }
                                                .animation(.easeOut, value: courseSlect)
                                            if courseSlect == item {
                                                RoundedRectangle(cornerRadius: 20)
                                                    .frame(width: 80, height: 3)
                                                    .foregroundColor(Color("main-green"))
                                                    .offset(x:5, y: 63)
                                            }
                                        }}
                                }
                               
                                
                            }
                        }
                    }
                }
                .padding(.bottom, 5)
            }
            .padding(.bottom, 10)
            if selectedCourse.count > 0{
                
                Course_Down_View(TeacherImag: json[now,"name"].stringValue, TeacherName:json[now,"fullname"].stringValue, Course_name: json[now,"title"].stringValue, Email: json[now,"email"].stringValue, WorkTime: json[now,"worktime"].stringValue, OfficeLocation: json[now,"workroom"].stringValue, OfficeLocation_Map: json[now,"workroomdetail"].stringValue)
            }
        }
    }
}


struct Course_Previews: PreviewProvider {
    static var previews: some View {
        Course()
    }
}
