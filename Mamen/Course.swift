//
//  Course.swift
//  Mamen
//
//  Created by Chester Zhao on 12/19/22.
//

import SwiftUI

struct Course: View {
    
    
    @State var showDetailView = false
    @State var showWebView = false
    @State var courseSlect = 1

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
            ZStack {
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        ZStack {
                            
                            HStack {
                                ZStack {
                                    Course_card(image: "C-image", name: "C&C++", emoji: "🧑🏻‍💻")
                                        .onTapGesture {
                                            courseSlect = 1
                                            TapticEngine.impact.feedback(.medium)
                                        }
                                        .animation(.easeOut, value: courseSlect)
                                    if courseSlect == 1 {
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 80, height: 3)
                                            .foregroundColor(Color("main-green"))
                                            .offset(x:5, y: 63)
                                    }
                                }
                                ZStack {
                                    Course_card(image: "DB-image", name: "DB", emoji: "🧑🏻‍💻")
                                        .onTapGesture {
                                            courseSlect = 2
                                            TapticEngine.impact.feedback(.medium)
                                        }
                                        .animation(.easeOut, value: courseSlect)
                                    if courseSlect == 2 {
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 80, height: 3)
                                            .foregroundColor(Color("main-green"))
                                            .offset(x:5, y: 63)
                                    }
                                }
                                ZStack {
                                    Course_card(image: "IPD-image", name: "IPD", emoji: "🧑🏽‍🔧")
                                        .onTapGesture {
                                            courseSlect = 3
                                            TapticEngine.impact.feedback(.medium)
                                        }
                                        .animation(.easeOut, value: courseSlect)
                                    if courseSlect == 3 {
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 80, height: 3)
                                            .foregroundColor(Color("main-green"))
                                            .offset(x:5, y: 63)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.bottom, 5)
            }
            .padding(.bottom, 10)
           
            if courseSlect == 1 {
                Course_Down_View(TeacherImag: "leon", TeacherName: "Leno Liang", Course_name: "C&C++", Email: "maged@zy.edu.cn", WorkTime: "9:00AM - 7:00PM", OfficeLocation: "8 Building, CDUT", OfficeLocation_Map: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China")
            }
            if courseSlect == 2 {
                Course_Down_View(TeacherImag: "maged", TeacherName: "Maged Refat", Course_name: "Database", Email: "maged@zy.edu.cn", WorkTime: "9:00AM - 7:00PM", OfficeLocation: "8 Building, CDUT", OfficeLocation_Map: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China")
            }
            if courseSlect == 3 {
                Course_Down_View(TeacherImag: "maged", TeacherName: "Maged Refat", Course_name: "Database", Email: "maged@zy.edu.cn", WorkTime: "9:00AM - 7:00PM", OfficeLocation: "8 Building, CDUT", OfficeLocation_Map: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China")
            }
        }
    }
}


struct Course_Previews: PreviewProvider {
    static var previews: some View {
        Course()
    }
}
