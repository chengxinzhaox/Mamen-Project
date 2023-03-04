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
        ZStack {
            RoundedRectangle(cornerRadius: 20,style: .continuous )
                .fill(Color(red: 0.869, green: 0.919, blue: 0.918))
                .frame(height: 580)
                .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.849), radius: 4, x: 1, y: 1)
                .ignoresSafeArea().offset(y: 180)
            VStack {
                HStack {
                    Text("Current Modules")
                        .font(.custom("AirbnbCereal_W_Bd", size:25))
                        .foregroundColor(Color("main-green"))
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 20)
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
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
                                        .frame(width: 30, height: 5)
                                        .foregroundColor(Color("main-green"))
                                        .offset(y: 75)
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
                                        .frame(width: 30, height: 5)
                                        .foregroundColor(Color("main-green"))
                                        .offset(y: 75)
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
                                        .frame(width: 30, height: 5)
                                        .foregroundColor(Color("main-green"))
                                        .offset(y: 75)
                                }
                            }
                        }
                        .frame(height: 170)
                    }
                }
                .padding(.leading, 10)
                Spacer()
            }
            if courseSlect == 1 {
                Course_C_View()
            }
            if courseSlect == 2 {
                Course_DB_View()
            }
            if courseSlect == 3 {
                Course_IPD_View()
            }
        }
    }
}

//MARK: - The course card view
struct Course_card: View {
    
    var image: String
    var name: String
    var emoji: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 150, height: 140)
                .foregroundColor(.white)
                .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.708), radius: 4, x: 1, y: 1)
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                HStack {
                    Text(name)
                        .font(.custom("AirbnbCereal_W_Bd", size:15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding()
                    Spacer()
                }
                .padding(1)
            }
            .cornerRadius(20)
            .frame(width: 150)
            HStack {
                Text(emoji)
                    .padding()
                    .font(.largeTitle)
                    .offset(y: 5)
                Spacer()
            }
            .frame(width: 160)
        }
        .padding(.bottom, 10)
    }
}

//MARK: - Teacher card view
struct TeacherView: View {
    var image: String
    var name: String
    var mail: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15,style: .continuous )
                .fill(Color.white)
                .frame(width: 350, height: 70)
                .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.708), radius: 4, x: 1, y: 1)
            HStack {
                ZStack {
                    Image(image)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Circle()
                        .stroke(lineWidth: 3)
                        .frame(width: 50)
                        .foregroundColor(Color("highlight-blue"))
                }
                .padding(.leading, 45)

                VStack(alignment: .leading) {
                    Text(name)
                        .font(.custom("AirbnbCereal_W_Bd", size:16))
                        .offset(y: -1)
                    Text(mail)
                        .font(.custom("AirbnbCereal_W_Md", size:12))
                        .offset(y: 2)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 20)
                Spacer()
            }
        }
    }
}

//MARK: - Coure file View
struct CourseFileView: View {
    var image: String
    var name: String
    var time: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous )
                .fill(Color.white)
                .frame(width: 350, height: 60)
                .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.849), radius: 4, x: 1, y: 1)
            ZStack {
                HStack {
                    ZStack {
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 50)
                    }
                    .padding(.leading, 40)
                    .padding(.trailing, 10)

                    VStack(alignment: .leading) {
                        Text(name)
                            .font(.custom("AirbnbCereal_W_Bd", size:15))
                            .fontWeight(.bold)
                            .padding(.vertical, 0.1)
                            .lineLimit(1)
                        Text(time)
                            .font(.custom("AirbnbCereal_W_Md", size:12))
                            .foregroundColor(.secondary)
                            .fontWeight(.medium)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct Course_Previews: PreviewProvider {
    static var previews: some View {
        Course()
    }
}
