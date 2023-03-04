//
//  ViewElements.swift
//  Mamen
//
//  Created by Chester Zhao on 3/5/23.
//

import SwiftUI

struct ViewElements: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


// MARK: - Coure file View

struct CourseFileView: View {
    
    var image: String
    var name: String
    var time: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.white)
                .frame(width: 350, height: 60)
                .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.849), radius: 4, x: 1, y: 1)
                .opacity(0)
                .onTapGesture {
                    
                }
            ZStack {
                HStack {
                    ZStack {
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 50)
                    }
                    .padding(.leading, 25)
                    .padding(.trailing, 10)

                    VStack(alignment: .leading) {
                        Text(name)
                            .font(.custom("AirbnbCereal_W_Bd", size: 15))
                            .fontWeight(.bold)
                            .padding(.vertical, 0.1)
                            .lineLimit(1)
                        Text(time)
                            .font(.custom("AirbnbCereal_W_Md", size: 12))
                            .foregroundColor(.secondary)
                            .fontWeight(.medium)
                    }
                    Spacer()
                }
            }
        }
    }
}

// MARK: - Teacher card view

struct TeacherView: View {
    var image: String
    var name: String
    var mail: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 90)
                .frame(height: 70)
                .foregroundColor(.white)
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
                .padding(.leading, 25)

                VStack(alignment: .leading) {
                    Text(name)
                        .font(.custom("AirbnbCereal_W_Bd", size: 16))
                        .offset(y: -1)
                    Text(mail)
                        .font(.custom("AirbnbCereal_W_Md", size: 12))
                        .offset(y: 2)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 20)
                Spacer()
            }
        }
    }
}

// MARK: - The course card view

struct Course_card: View {
    
    var image: String
    var name: String
    var emoji: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 150, height: 110)
                .foregroundColor(.white)
                .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.708), radius: 4, x: 1, y: 1)
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(y:-19)
                HStack {
                    Text(name)
                        .font(.custom("AirbnbCereal_W_Bd", size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .offset(y:-13)
                        .padding()
                    Spacer()
                }
            }
            .cornerRadius(20)
            .frame(width: 150)
            HStack {
                Text(emoji)
                    .padding()
                    .font(.largeTitle)
                    .offset(y: -5)
                Spacer()
            }
            
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .padding(.bottom, 10)
    }
}



// MARK: - SettingElement view

struct SettingElementView: View {
    var icon: String
    var name: String
    var color: Color

    var body: some View {
        HStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 18)
                .fontWeight(.light)
                .foregroundColor(.black)
            Text(name)
                .font(.custom("AirbnbCereal_W_Bk", size: 17))
                .foregroundColor(.black)
                .padding(.leading, 7)
            Spacer()
        }
        .padding([.top, .leading])
    }
}

struct Divider_Person: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 100)
                .frame(width: 350, height: 1)
                .foregroundColor(Color(hex: "DDDDDD"))
            
        }
    }
}


// MARK: - Calendar DateSlect view

/**
 Date slect element  view
 
 - date: slect date
 - frontColor: icon color
 - backColor: back color
 
*/
struct DateSlectView: View {
    var date: String
    var frontColor: Color
    var backColor: Color
    
    var body: some View {
        Circle()
            .frame(width: 50, height: 50)
            .foregroundColor(backColor)
            .overlay {
                Text(date)
                    .font(.custom("AirbnbCereal_W_Bd", size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(frontColor)
            }
            .padding(.trailing, 10)
    }
}


// MARK: - Calendar Date view

/**
 Course Element View
 
 - name: course name
 - place: course place
 - begin: course begin time
 - over: course over time
 
 */
struct DateView: View {
    
    var name: String
    var place: String
    var begin: String
    var over: String
    var color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .frame(width: 350, height: 60)
            .foregroundColor(Color.white)
            .shadow(color: Color(hue: 0.054, saturation: 0.0, brightness: 0.92), radius: 2, x: 0, y: 0)
            .overlay {
                HStack {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 7, height: 40)
                        .foregroundColor(color)
                    VStack(alignment: .leading) {
                        Text(name)
                            .font(.custom("AirbnbCereal_W_Bd", size: 14))
                            .foregroundColor(.black)
                            
                        Text(place)
                            .foregroundColor(.gray)
                            .font(.custom("AirbnbCereal_W_Md", size: 13))
                    }
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(begin)
                            .foregroundColor(.gray)
                            .font(.custom("AirbnbCereal_W_Md", size: 13))
                            
                        Text(over)
                            .foregroundColor(.gray)
                            .font(.custom("AirbnbCereal_W_Md", size: 13))
                            
                    }
                }
                .padding(.trailing, 12)
                .padding(.leading, 12)
            }
    }
}


// MARK: - DeadLineView view

struct DeadLineView: View {
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
                        .font(.custom("AirbnbCereal_W_Bd", size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text(inf)
                        .font(.custom("AirbnbCereal_W_Bk", size: 10))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .offset(y: 2)
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(Color.white)
                            .font(.system(size: 11))
                        Text(time)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .font(.custom("AirbnbCereal_W_Md", size: 11))
                    }
                    .offset(y: 10)
                }
                .offset(y: -7)
                HStack {
                    Text("DUE")
                        .font(.custom("AirbnbCereal_W_Bd", size: 8))
                        .foregroundColor(Color.white)
                    Text(DUO_day)
                        .foregroundColor(Color.white)
                        .font(.custom("AirbnbCereal_W_Bd", size: 8))
                        .offset(x: 135)
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
                .offset(y: 5)
            }
        }
        .padding(.trailing, 10)
    }
}



// MARK: - Tools view

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
                    Image(icon)
                        .offset(y:4)
                    Text(name)
                        .foregroundColor(.white)
                        .font(.custom("AirbnbCereal_W_xBd", size: 12))
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
                            .foregroundColor(.black)
                            .font(.custom("AirbnbCereal_W_Bd", size: 12))
                        Text(place)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .font(.custom("AirbnbCereal_W_Md", size:10))
                    }
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        Text(begin)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .font(.custom("AirbnbCereal_W_Md", size:10))
                        Text(over)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                            .font(.custom("AirbnbCereal_W_Md", size:10))
                    }
                }
                .padding(.trailing, 12)
                .padding(.leading, 12)
            }
    }
}


// MARK: - Message view

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
                    .font(.custom("AirbnbCereal_W_Bd", size:10))
                Text(massage)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .font(.custom("AirbnbCereal_W_Md", size:10))
                Spacer()
                Text(time)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.809))
                    .font(.custom("AirbnbCereal_W_Md", size:10))
            }
            .padding(.trailing, 10)
            .padding(.leading, 10)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct Tools_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView(name: "Pay", icon: "Pay")
    }
}

