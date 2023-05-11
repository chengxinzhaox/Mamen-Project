//
//  CalendarView.swift
//  Mamen
//
//  Created by Chester Zhao on 1/4/23.
//

import SwiftUI
import SwiftyJSON

struct CalendarView: View {
    
    @State private var showDetailView = false
    @State private var selectedElement: Calendar_class?

    @State private var coursejson:responseBody=responseBody(result: 0, message: "", data: nil)
    @State var DateSelect: Int = 1
    let weekdayname=["Null","Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
//    @State var Calendar_Clss_Set = [
//        Calendar_class(date: 1, name: "C&C++", place: "8103", begin: "8:00AM", over: "9:45AM", color: Color(hex: "98E2D3")),
//        Calendar_class(date: 1, name: "Human Interface", place: "6A203", begin: "10:00AM", over: "11:45AM", color: Color(hex: "CCC8EF")),
//        Calendar_class(date: 2, name: "Web Application", place: "8201", begin: "10:00AM", over: "11:45AM", color: Color(hex: "C8E8AE")),
//        Calendar_class(date: 3, name: "C&C++", place: "8403", begin: "8:00AM", over: "9:45AM", color: Color(hex: "98E2D3")),
//        Calendar_class(date: 3, name: "DataBase", place: "8403", begin: "2:30PM", over: "4:45AM", color: Color(hex: "FF927F")),
//        Calendar_class(date: 4, name: "CSS&HTML", place: "6A101", begin: "8:00AM", over: "9:45AM", color: Color(hex: "9FECEC")),
//        Calendar_class(date: 4, name: "Human Interface", place: "6A201", begin: "10:00AM", over: "11:45AM", color: Color(hex: "CCC8EF")),
//        Calendar_class(date: 5, name: "DataBase", place: "8203", begin: "8:00AM", over: "9:45AM", color: Color(hex: "FF927F")),
//        Calendar_class(date: 5, name: "Human Interface", place: "8606", begin: "2:30PM", over: "4:05PM", color: Color(hex: "CCC8EF"))
//    ]

    var body: some View {
        VStack {
            HStack {
                Text("Calendar")
                    .font(.custom("AirbnbCereal_W_Bd", size: 25))
                    .foregroundColor(Color("main-green"))
                    .padding([.top, .leading])
                Spacer()
            }.task {
                r.GetAllTimeTables { result in
                    self.coursejson=result
                    print(result)
                }
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    DateSlectView(date: "Mon", frontColor:weekdayname [DateSelect] == "Mon" ? .white : .gray, backColor: weekdayname [DateSelect] == "Mon" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = 1
                            TapticEngine.impact.feedback(.medium)
                        }
                    DateSlectView(date: "Tue", frontColor: weekdayname [DateSelect] == "Tue" ? .white : .gray, backColor: weekdayname [DateSelect] == "Tue" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = 2
                            TapticEngine.impact.feedback(.medium)
                        }
                    DateSlectView(date: "Wed", frontColor: weekdayname [DateSelect] == "Wed" ? .white : .gray, backColor: weekdayname [DateSelect] == "Wed" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = 3
                            TapticEngine.impact.feedback(.medium)
                        }
                    DateSlectView(date: "Thu", frontColor: weekdayname [DateSelect] == "Thu" ? .white : .gray, backColor: weekdayname [DateSelect] == "Thu" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = 4
                            TapticEngine.impact.feedback(.medium)
                        }
                    DateSlectView(date: "Fri", frontColor: weekdayname [DateSelect] == "Fri" ? .white : .gray, backColor: weekdayname [DateSelect] == "Fri" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = 5
                            TapticEngine.impact.feedback(.medium)
                        }
                    DateSlectView(date: "Sat", frontColor: weekdayname [DateSelect] == "Sat" ? .white : .gray, backColor: weekdayname [DateSelect] == "Sat" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = 6
                            TapticEngine.impact.feedback(.medium)
                        }
                    DateSlectView(date: "Sun", frontColor: weekdayname [DateSelect] == "Sun" ? .white : .gray, backColor: weekdayname [DateSelect] == "Sun" ? Color("main-green") : Color(hex: "F7F7F7"))
                        .onTapGesture {
                            DateSelect = 7
                            TapticEngine.impact.feedback(.medium)
                        }
                }
            }
            .padding([.top, .leading])

            Spacer()
                .frame(height: 40)

            //
            let json=JSON(coursejson.data)
            ForEach(1..<8, id: \.self) { index in
                
                if index==DateSelect{
                    DateView(name:json[index,"title"].stringValue ,
                             place: json[index,"room"].stringValue,
                             begin: json[index,"start"].stringValue,
                             over: json[index,"end"].stringValue,
                             color: Color(hex: json[index,"color"].stringValue))
                }}
            

            Spacer()
        }
    }
}

func filterClassesByDate(date: Int, classes: [Calendar_class]) -> [Calendar_class] {
    var Date_Calendar: [Calendar_class] = []
    for index in classes.indices {
        if classes[index].date == date {
            Date_Calendar.append(classes[index])
        }
    }
    return Date_Calendar
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
