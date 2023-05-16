//
//  HomeView.swift
//  Mamen
//
//  Created by Chester Zhao on 12/24/22.
//

import SwiftUI
import SwiftyJSON

struct HomeView: View {
    @State private var deadlinejson:responseBody=responseBody(result: 0, message: "", data: nil)
    @State private var messagejson:responseBody=responseBody(result: 0, message: "", data: nil)
    @State private var coursejson:responseBody=responseBody(result: 0, message: "", data: nil)
    var body: some View {
        ScrollView(showsIndicators: false) {
            // MARK: - Dadline view

            VStack {
                HStack {
                    Text("\(Date(), style: .date)")
                        .font(.custom("AirbnbCereal_W_Md", size: 17))
                        .fontWeight(/*@START_MENU_TOKEN@*/ .semibold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .listRowSeparator(.hidden)
                        .padding(.leading)
                    Spacer()
                }
                .padding(.bottom, 1)
                .task {
                    r.GetDeadline { result in
                        self.deadlinejson=result
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        let json=JSON(deadlinejson.data ?? "")
                        ForEach(0 ..< json.count,id: \.self) { item in
                            DeadLineView(name: json[item,"title"].stringValue, inf: json[item,"info"].stringValue, time: json[item,"deadline"].stringValue, DUO_day: json[item,"remaindays"].stringValue, line: CGFloat(json[item,"length"].intValue))
                        }
                       
                    }
                    .padding(.leading)
                    .frame(height: 120)
                }
                .offset(y: -10)
            }

            // MARK: - Message view

            VStack {
                HStack {
                    Text("Message")
                        .font(.custom("AirbnbCereal_W_Bd", size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color("main-green"))
                        .padding(.leading)
                    Spacer()
                }.task {
                    r.GetInformation() { result in
                        self.messagejson=result
                    }
                }
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color(hex: "e8e8e8"), lineWidth: 1)
                    .frame(width: 350, height: 75)
                    // .foregroundColor(Color.white)

                    .overlay {
                        VStack {
                            Group {
                                let json=JSON(messagejson.data ?? "")
                                
                                ForEach(0..<json.count,id:\.self) { item in
                                    MassageView(name: json[item,"title"].stringValue, icon: json[item,"icon"].stringValue, massage: json[item,"info"].stringValue, time: json[item,"date"].stringValue)
                                }
                            }
                            .padding(.top, 0.1)
                        }
                    }
            }
            .padding(.bottom)

            // MARK: - Day View

            VStack {
                HStack {
                    Text("Your Day")
                        .font(.custom("AirbnbCereal_W_Bd", size: 18))
                        .foregroundColor(Color("main-green"))
                        .padding(.leading)
                    Spacer()
                }.task {
                    r.GetAllTimeTables { result in
                        self.coursejson=result
                        print(result)
                    }
                }
                let json=JSON(coursejson.data ?? "")
                ForEach(0 ..< json.count,id:\.self) { item in
                    if json[item,"week"].stringValue==String(whatsdaytoday()-1){
                        DayView(name: json[item,"title"].stringValue, place: json[item,"room"].stringValue, begin: json[item,"start"].stringValue, over: json[item,"end"].stringValue, color: Color(hex: json[item,"color"].stringValue))
                    }
                   
                }
                
            }
            .padding(.bottom)

            // MARK: - Tools View

            VStack {
                HStack {
                    Text("Useful Tools")
                        .font(.custom("AirbnbCereal_W_Bd", size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color("main-green"))
                        .padding(.leading)
                    Spacer()
                }
                HStack {
                    NavigationLink(destination: Translator_View()) {
                        ToolsView(name: "Translator", icon: "Exam")
                    }

                    NavigationLink(destination: CourseSlectView()) {
                        ToolsView(name: "Select", icon: "Course 1")
                    }

                    NavigationLink(destination: Slected()) {
                        ToolsView(name: "My Courses", icon: "Pay")
                    }
                }
                HStack {
                    NavigationLink(destination: LibaryView()) {
                        ToolsView(name: "Libary", icon: "Book")
                    }
                    
                    NavigationLink(destination: LibaryView()) {
                        ToolsView(name: "Room", icon: "Room")
                    }

                    
                    ToolsView(name: "Drop out", icon: "Drop")
                }
            }
            
            Spacer()
                .frame(height: 40)
        }
    }

    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
