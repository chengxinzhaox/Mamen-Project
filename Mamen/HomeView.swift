//
//  HomeView.swift
//  Mamen
//
//  Created by Chester Zhao on 12/24/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack {
                    
                    //MARK: - Dadline view
                    VStack {
                        HStack {
                            Text("\(Date(), style: .date)")
                                .font(.system(size: 17))
                                .fontWeight(/*@START_MENU_TOKEN@*/ .semibold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.gray)
                                .listRowSeparator(.hidden)
                                .padding(.leading)
                            Spacer()
                        }
                        .padding(.bottom, 1)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                DadLineView(name: "Databases Part 2", inf: "Individual design", time: "2022-12-28", DUO_day: "5  DAY", line: 100)
                                DadLineView(name: "The Human Interface ", inf: "Coursework", time: "2022-12-25", DUO_day: "3  DAY", line: 150)
                            }
                            .padding(.leading)
                            .frame(height: 120)
                        }
                        .offset(y: -10)
                    }

                    //MARK: - Message view
                    VStack{
                        HStack {
                            Text("Message")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(Color("main-green"))
                                .padding(.leading)
                            Spacer()
                        }
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .frame(width: 350, height: 75)
                            .foregroundColor(Color.white)
                            .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.92), radius: 4, x: 0, y: 0)
                            .overlay(){
                                VStack{
                                    Group{
                                        MassageView(name: "Doctument", icon: "doc.text.fill", massage: "IPD have new doctument", time: "5 hours age")
                                        MassageView(name: "Daed Line", icon: "clock.fill", massage: "HCI have new daed line", time: "2 days age")
                                        MassageView(name: "Dead Line", icon: "clock.fill", massage: "C&C++ have new daed line", time: "2 days age")
                                    }
                                    .padding(.top, 0.1)
                                }
                                
                            }
                    }
                    .padding(.bottom)
                    
                    //MARK: - Day View
                    VStack {
                        HStack {
                            Text("Your Day")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(Color("main-green"))
                                .padding(.leading)
                            Spacer()
                        }
                        DayView(name: "Data Base", place: "8304", begin: "10:15 AM", over: "11:05 AM", color: .pink)
                        DayView(name: "IPD", place: "6A101", begin: "2:30 PM", over: "3:00 PM", color: .teal)
                        DayView(name: "C&C++", place: "6A102", begin: "4:30 PM", over: "6:00 PM", color: .cyan)
                    }
                    .padding(.bottom)
                    
                    //MARK: - Tools View
                    VStack {
                        HStack {
                            Text("Useful Tools")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(Color("main-green"))
                                .padding(.leading)
                            Spacer()
                        }
                        HStack {
                            NavigationLink(destination: LibaryView()){
                                ToolsView(name: "Libary", icon: "books.vertical.fill")
                            }
                            
                            ToolsView(name: "Course", icon: "filemenu.and.selection")
                            ToolsView(name: "Exam", icon: "pencil.line")
                        }
                        HStack {
                            ToolsView(name: "Pay", icon: "creditcard.fill")
                            ToolsView(name: "Room", icon: "studentdesk")
                            ToolsView(name: "Drop out", icon: "square.and.arrow.up.trianglebadge.exclamationmark")
                        }
                    }
                    
                }
                .navigationBarTitle("Home", displayMode: .automatic)
                .listStyle(.plain)
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }

    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}

struct DadLineView: View {
    var name: String
    var inf: String
    var time: String
    var DUO_day: String
    var line: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .frame(width: 210, height: 100)
                .foregroundColor(Color(red: 0.823, green: 0.888, blue: 0.887))
                .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.92), radius: 4, x: 0, y: 0)
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text(inf)
                        .font(.system(size: 10))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .offset(y: 2)
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(Color.white)
                            .font(.system(size: 10))
                        Text(time)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .font(.system(size: 10))
                    }
                    .offset(y: 10)
                }
                .offset(y: -7)
                HStack {
                    Text("DUE")
                        .font(.system(size: 8))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text(DUO_day)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .font(.system(size: 8))

                        .offset(x: 130)
                }
                .offset(y: 11)
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: 190, height: 8)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    Rectangle()
                        .frame(width: line, height: 8)
                        .cornerRadius(10)
                        .foregroundColor(Color("main-green"))
                }
                .offset(y: 8)
            }
        }
        .padding(.trailing, 10)
    }
}

struct ToolsView: View {
    var name: String
    var icon: String

    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .frame(width: 110, height: 80)
            .foregroundColor(Color("main-green"))
            .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.92), radius: 4, x: 0, y: 0)
            .overlay {
                VStack {
                    Image(systemName: icon)
                        .foregroundColor(.white)
                    Text(name)
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .offset(y: 4)
                }
            }
    }
}

struct DayView: View {
    
    var name: String
    var place: String
    var begin: String
    var over: String
    var color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .frame(width: 350, height: 45)
            .foregroundColor(Color.white)
            .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.92), radius: 4, x: 0, y: 0)
            .overlay {
                HStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 5, height: 30)
                        .foregroundColor(color)
                    VStack(alignment: .leading){
                        Text(name)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .font(.system(size: 12))
                            .offset(y: -1)
                        Text(place)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .font(.system(size: 11))
                            .offset(y: -1)
                    }
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        Text(begin)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .font(.system(size: 10))
                            .offset(y: -1)
                        Text(over)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .font(.system(size: 10))
                            .offset(y: -1)
                    }
                }
                .padding(.trailing, 12)
                .padding(.leading, 12)
            }
    }
}

struct MassageView: View {
    
    var name: String
    var icon: String
    var massage: String
    var time: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: icon)
                    .foregroundColor(Color("main-green"))
                    .font(.system(size: 10))
                Text(name)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 10))
                Text(massage)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                Spacer()
                Text(time)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.809))
                    .font(.system(size: 10))
            }
            .padding(.trailing, 10)
            .padding(.leading, 10)
        }
    }
}

