//
//  SlectedDetailView.swift
//  Mamen
//
//  Created by Chester Zhao on 3/6/23.
//

import SwiftUI

struct CourseDetailView: View {
    
    var course: Course_class
    @Environment(\.dismiss) var dismiss
    @State var showMap = false
    @AppStorage("selectedCourse") var selectedCourse: [String] = []
    @State private var isselect=false
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(course.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 255)
                    .overlay {
                        VStack {
                            Image(systemName: course.slected ? "checkmark.circle.fill" : "")
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                                .padding()
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(.top, 40)
                        }
                    }
                VStack {
                    Group {
                        HStack {
                            Text(course.name)
                                .font(.custom("AirbnbCereal_W_Bd", size: 25))
                            Spacer()
                        }
                        HStack {
                            Text(course.type)
                                .font(.custom("AirbnbCereal_W_Bk", size: 14))
                            Spacer()
                        }
                        .padding(.top, -9)
                    }

                    Divider_Person()
                        .padding(.vertical, 12.0)

                    Group {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Taught by " + course.teacher_name)
                                    .font(.custom("AirbnbCereal_W_Bd", size: 23))
                                Text("Oxford Brooks")
                                    .font(.custom("AirbnbCereal_W_Md", size: 15))
                                    .padding(.top, -9)
                            }
                            Spacer()
                            Image(course.teacher_image)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        }
                    }

                    Divider_Person()
                        .padding(.vertical, 12.0)

                    Group{
                        VStack {
                            HStack {
                                Text("About this course")
                                    .font(.custom("AirbnbCereal_W_Bd", size: 23))
                                Spacer()
                            }
                            HStack {
                                Text(course.descrip)
                                    .font(.custom("AirbnbCereal_W_Bk", size: 17))
                                    .padding(.top, -9)
                                Spacer()
                            }
                        }
                    }
                    
                    Divider_Person()
                        .padding(.vertical, 12.0)
                    
                    VStack {
                        HStack {
                            Text("Where should you go")
                                .font(.custom("AirbnbCereal_W_Bd", size: 23))
                                
                            Spacer()
                        }
                        
                        MapViewNoBack(location: course.location, interactionMode: [])
                            .frame(width: 340, height: 190)
                            .cornerRadius(15)
                            .padding(.top, -0)
                            .onTapGesture {
                                self.showMap = true
                                TapticEngine.impact.feedback(.medium)
                            }
                            .sheet(isPresented: $showMap) {
                                MapView(location: course.location)
                                    .edgesIgnoringSafeArea(.all)
                            }
                            .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.849), radius: 4, x: 1, y: 1)
                        
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Button {
                        
                        self.isselect.toggle()
                        switch self.isselect{
                        case true:
                            self.selectedCourse.append(course.name)
                            debugPrint(self.selectedCourse)
                        case false:
                            self.selectedCourse=self.selectedCourse.filter({ name in
                                name != course.name
                            })
                        }
                    } label: {
                        HStack{
                            RoundedRectangle(cornerRadius: 90, style: .continuous)
                                .frame(width: 350, height: 50)
                                .foregroundColor(Color("main-green"))
                                .overlay {
                                    Text(self.isselect ? "Delete" : "Choose")
                                        .font(.custom("AirbnbCereal_W_Bd", size: 15))
                                        .foregroundColor(.white)
                                }
                        }
                    }

                    
                    
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 80).onAppear(){
                    if selectedCourse.contains(course.name){
                        self.isselect=true
                    }else{
                        self.isselect=false
                    }
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: Course_class(name: "C&C++ Development", image: "C_imag", type: "Basic Course", location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", teacher_name: "Leon Liang", teacher_image: "leon", teacher_emial: "leon@zy.edu.cn", teacher_workTime: "9:00AM - 7:00PM", teacher_office: "8 Building, CDUT", teacher_office_location: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China", descrip: "This course will help you master the high-level programming language, including key concepts such as pointers, memory management, classes, inheritance, and more. You will learn how to write efficient and effective C++ code for a variety of applications.", slected: false))
    }
}
