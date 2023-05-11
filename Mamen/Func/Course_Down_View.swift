//
//  Course_Down_View.swift
//  Mamen
//
//  Created by Chester Zhao on 3/4/23.
//

import SwiftUI
import SwiftyJSON

struct Course_Down_View: View {
    @State var showDetailView = false
    @State var showWebView = false
    @State private var filejson:responseBody=responseBody(result: 0, message: "", data: nil)
   
    var TeacherImag: String
    var TeacherName: String
    var Course_name: String
    var Email: String
    var WorkTime: String
    var OfficeLocation: String
    var OfficeLocation_Map: String
    
    var body: some View {
        VStack {
            TeacherView(image: TeacherImag, name: TeacherName, mail: Email)
                .onTapGesture {
                    self.showDetailView = true
                    TapticEngine.impact.feedback(.medium)
                }
                .sheet(isPresented: $showDetailView) {
                    TeachersView(TeacherName: TeacherName, Course_name: Course_name, Email: Email, WorkTime: WorkTime, OfficeLocation: OfficeLocation, OfficeLocation_Map: OfficeLocation_Map)
                }
            VStack {
                HStack {
                    Text("Document List")
                        .font(.custom("AirbnbCereal_W_Bd", size: 18))
                        .foregroundColor(Color("main-green"))
                        .padding(.leading, 25)
                        .padding(.top, 15)
                    Spacer()
                }.task {
                    r.GetCourseFiles { result in
                        self.filejson=result
                        print(result)
                    }
                }
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        let json=JSON(self.filejson.data ?? "")
                        ForEach(0..<json.count, id: \.self) { index in
                            if json[index,"course"].stringValue==Course_name{
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            self.showWebView.toggle()
                                            TapticEngine.impact.feedback(.medium)
                                        }
                                        .sheet(isPresented: $showWebView) {
                                            SafariView(url: URL(string: json[index,"url"].stringValue)!)
                                        }
                                    CourseFileView(image: json[index,"type"].stringValue, name: json[index,"title"].stringValue, time: json[index,"date"].stringValue)
                                }
                            }}
                    }
                }
            }
        }
    }
}

struct Course_Down_View_Previews: PreviewProvider {
    static var previews: some View {
        Course_Down_View(TeacherImag: "maged", TeacherName: "11", Course_name: "11", Email: "11", WorkTime: "11", OfficeLocation: "11", OfficeLocation_Map: "11")
    }
}
