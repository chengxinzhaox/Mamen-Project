//
//  Course_Down_View.swift
//  Mamen
//
//  Created by Chester Zhao on 3/4/23.
//

import SwiftUI

struct Course_Down_View: View {
    @State var showDetailView = false
    @State var showWebView = false
    
    var FileNames = ["Example-week7", "Example-week8", "Web Application Development ", "JAVA Development", "Data Base", "Swift Development", "CSS & HTML", "Generic English"]
    
    var FileTypes = ["ZIP", "PDF", "PDF", "ZIP", "PDF", "ZIP", "PDF", "ZIP"]
    
    var FileTimes = ["Dec 18 8:23PM", "Dec 17 8:23PM", "Dec 16 8:23PM", "Dec 15 8:23PM", "Dec 14 8:23PM", "Dec 13 8:23PM", "Dec 12 8:23PM", "Dec 11 8:23PM"]
    
    var FileURLS = ["https://student.zy.cdut.edu.cn/sites/student.zy.cdut.edu.cn/files/attachments/examples-week7-lecture.zip", "https://student.zy.cdut.edu.cn/sites/student.zy.cdut.edu.cn/files/attachments/examples-week7-lecture.zip", "https://student.zy.cdut.edu.cn/sites/student.zy.cdut.edu.cn/files/attachments/examples-week7-lecture.zip", "https://student.zy.cdut.edu.cn/sites/student.zy.cdut.edu.cn/files/attachments/examples-week7-lecture.zip", "https://student.zy.cdut.edu.cn/sites/student.zy.cdut.edu.cn/files/attachments/examples-week7-lecture.zip", "https://student.zy.cdut.edu.cn/sites/student.zy.cdut.edu.cn/files/attachments/examples-week7-lecture.zip", "Chttps://student.zy.cdut.edu.cn/sites/student.zy.cdut.edu.cn/files/attachments/examples-week7-lecture.zip", "https://student.zy.cdut.edu.cn/sites/student.zy.cdut.edu.cn/files/attachments/examples-week7-lecture.zip"]
    
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
                }
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(FileNames.indices, id: \.self) { index in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .onTapGesture {
                                        self.showWebView.toggle()
                                        TapticEngine.impact.feedback(.medium)
                                    }
                                    .sheet(isPresented: $showWebView) {
                                        SafariView(url: URL(string: FileURLS[index])!)
                                    }
                                CourseFileView(image: FileTypes[index], name: FileNames[index], time: FileNames[index])
                            }
                        }
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
