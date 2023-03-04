//
//  CalendarView.swift
//  Mamen
//
//  Created by Chester Zhao on 1/4/23.
//

import SwiftUI

struct CalendarView: View {
    @State var DateSelect: String = "Mon"
    
    var body: some View {
        VStack {
            HStack {
                Text("Calendar")
                    .font(.custom("AirbnbCereal_W_Bd", size: 25))
                    .foregroundColor(Color("main-green"))
                    .padding([.top, .leading])
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    DateSlectView(date: "Mon", frontColor: DateSelect == "Mon" ? .white : .gray, backColor: DateSelect == "Mon" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = "Mon"
                            TapticEngine.impact.feedback(.medium)
                        }
                    DateSlectView(date: "Tue", frontColor: DateSelect == "Tue" ? .white : .gray, backColor: DateSelect == "Tue" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = "Tue"
                            TapticEngine.impact.feedback(.medium)
                        }
                    DateSlectView(date: "Wed", frontColor: DateSelect == "Wed" ? .white : .gray, backColor: DateSelect == "Wed" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = "Wed"
                            TapticEngine.impact.feedback(.medium)
                        }
                    DateSlectView(date: "Thu", frontColor: DateSelect == "Thu" ? .white : .gray, backColor: DateSelect == "Thu" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = "Thu"
                            TapticEngine.impact.feedback(.medium)
                        }
                    DateSlectView(date: "Fri", frontColor: DateSelect == "Fri" ? .white : .gray, backColor: DateSelect == "Fri" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = "Fri"
                            TapticEngine.impact.feedback(.medium)
                        }
                    DateSlectView(date: "Sat", frontColor: DateSelect == "Sat" ? .white : .gray, backColor: DateSelect == "Sat" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = "Sat"
                            TapticEngine.impact.feedback(.medium)
                        }
                    DateSlectView(date: "Sun", frontColor: DateSelect == "Sun" ? .white : .gray, backColor: DateSelect == "Sun" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = "Sun"
                            TapticEngine.impact.feedback(.medium)
                        }
                }
            }
            .padding([.top, .leading])
            Spacer()
                .frame(height: 40)
            switch DateSelect {
            case "Mon":
                DateView(name: "C++", place: "8201", begin: "20:00", over: "22:00", color: .gray)
            default:
                DateView(name: "IPD", place: "6A201", begin: "8:00", over: "10:00", color: .accentColor)
            }
            
            Spacer()
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}


