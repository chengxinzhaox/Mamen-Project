//
//  TeachersView.swift
//  Mamen
//
//  Created by Chester Zhao on 3/4/23.
//

import SwiftUI

struct TeachersView: View {
    @Environment(\.dismiss) var dismiss
    @State var showMap = false
    
    
    var TeacherName: String
    var Course_name: String
    var Email: String
    var WorkTime: String
    var OfficeLocation: String
    var OfficeLocation_Map: String
    
    var body: some View {
        ZStack {
            VStack {
                Image("Database_imag")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 500)
                    .ignoresSafeArea()
                Spacer()
            }
            
            Rectangle()
                .fill(Color(hex: "FFFFFF"))
                .frame(height: 600)
                .shadow(radius: 4.0)
                .ignoresSafeArea()
                .offset(y: 170)
            VStack {
                Spacer()
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(TeacherName)
                                    .font(.custom("AirbnbCereal_W_Bd", size: 30))
                                    //.foregroundColor(Color("main-green"))
                                    .foregroundColor(Color.black)
                                HStack(alignment: .center) {
                                    Image("University")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 17)
                                    Text("Oxford Brooks")
                                        .font(.custom("AirbnbCereal_W_Md", size: 16))
                                        .padding(.trailing)
                                    Image("Teacher_Course")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16)
                                    Text(Course_name)
                                        .font(.custom("AirbnbCereal_W_Md", size: 16))
                                }
                            }
                            Spacer()
                        }
                        .padding(.leading, 25)
                        Spacer()
                    }
                    Divider_Person()
                        .padding(.vertical, 12.0)
                        
                    VStack {
                        Spacer()

                        ZStack {
                            HStack {
                                Image("Mail")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                    .padding(.trailing, 10)
                                VStack(alignment: .leading) {
                                    Text("E-mail")
                                        .font(.custom("AirbnbCereal_W_Bd", size: 16))
                                        
                                    Text(Email)
                                        .font(.custom("AirbnbCereal_W_Bk", size: 15))
                                        .foregroundColor(Color.gray)
                                }
                                
                                Spacer()
                            }
                            .padding(.leading, 25)
                        }
                        
                        Divider_Person()
                            .padding(.vertical, 12.0)

                        HStack {
                            HStack {
                                Image("Time")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                            }
                            .padding(.trailing, 10)
                            VStack {
                                VStack(alignment: .leading) {
                                    Text("Work time")
                                        .font(.custom("AirbnbCereal_W_Bd", size: 16))
                                        
                                    Text(WorkTime)
                                        .font(.custom("AirbnbCereal_W_Bk", size: 15))
                                        .foregroundColor(Color.gray)
                                }
                            }
                            Spacer()
                        }
                        .padding(.leading, 25)
                        Spacer()
                            .frame(height: 10)
                        
                        HStack {
                            Image("Map")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                                .padding(.trailing, 10)
                            VStack(alignment: .leading) {
                                Text("Office location")
                                    .font(.custom("AirbnbCereal_W_Bd", size: 16))
                                    
                                Text(OfficeLocation)
                                    .font(.custom("AirbnbCereal_W_Bk", size: 15))
                                    .foregroundColor(Color.gray)
                            }
                            Spacer()
                        }
                        .padding(.leading, 25)
                        .padding(.top, 7)
                        
                        Divider_Person()
                            .padding(.vertical, 12.0)
                        
                        HStack {
                            Text("Where you'll be")
                                .font(.custom("AirbnbCereal_W_Bd", size: 22))
                                
                            Spacer()
                        }
                        .padding(.leading, 25)
                        .padding(.bottom)
                        
                        MapViewNoBack(location: OfficeLocation_Map, interactionMode: [])
                            .frame(width: 350, height: 190)
                            .cornerRadius(15)
                            .padding(.horizontal)
                            .onTapGesture {
                                self.showMap = true
                                TapticEngine.impact.feedback(.medium)
                            }
                            .sheet(isPresented: $showMap) {
                                MapView(location: OfficeLocation_Map)
                                    .edgesIgnoringSafeArea(.all)
                            }
                            .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.849), radius: 4, x: 1, y: 1)
                    }
                }
                .frame(height: 490)
            }
        }
    }
}

struct TeachersView_Previews: PreviewProvider {
    static var previews: some View {
        TeachersView(TeacherName: "Maged Refat", Course_name: "Data Base", Email: "maged@zy.cdut.cn", WorkTime: "9:00AM - 7:00PM", OfficeLocation: "8 Building, CDUT", OfficeLocation_Map: "No.1, Erxianqiao East 3rd Road, Chenghua Chengdu Sichuan China")
    }
}
