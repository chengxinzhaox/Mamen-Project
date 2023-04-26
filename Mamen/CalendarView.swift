//
//  CalendarView.swift
//  Mamen
//
//  Created by Chester Zhao on 1/4/23.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var showDetailView = false
    @State private var selectedElement: Calendar_class?

    
    @State var DateSelect: String = "Mon"
    
    @State var Calendar_Clss_Set = [
        Calendar_class(date: 1, name: "C&C++", place: "8103", begin: "8:00AM", over: "9:45AM", color: Color(hex: "98E2D3")),
        Calendar_class(date: 1, name: "Human Interface", place: "6A203", begin: "10:00AM", over: "11:45AM", color: Color(hex: "CCC8EF")),
        Calendar_class(date: 2, name: "Web Application", place: "8201", begin: "10:00AM", over: "11:45AM", color: Color(hex: "C8E8AE")),
        Calendar_class(date: 3, name: "C&C++", place: "8403", begin: "8:00AM", over: "9:45AM", color: Color(hex: "98E2D3")),
        Calendar_class(date: 3, name: "DataBase", place: "8403", begin: "2:30PM", over: "4:45AM", color: Color(hex: "FF927F")),
        Calendar_class(date: 4, name: "CSS&HTML", place: "6A101", begin: "8:00AM", over: "9:45AM", color: Color(hex: "9FECEC")),
        Calendar_class(date: 4, name: "Human Interface", place: "6A201", begin: "10:00AM", over: "11:45AM", color: Color(hex: "CCC8EF")),
        Calendar_class(date: 5, name: "DataBase", place: "8203", begin: "8:00AM", over: "9:45AM", color: Color(hex: "FF927F")),
        Calendar_class(date: 5, name: "Human Interface", place: "8606", begin: "2:30PM", over: "4:05PM", color: Color(hex: "CCC8EF"))
    ]

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

            //
            switch DateSelect {
            case "Mon":
                ForEach(filterClassesByDate(date: 1, classes: Calendar_Clss_Set).indices, id: \.self) { index in
                    DateView(name: filterClassesByDate(date: 1, classes: Calendar_Clss_Set)[index].name,
                             place: filterClassesByDate(date: 1, classes: Calendar_Clss_Set)[index].place,
                             begin: filterClassesByDate(date: 1, classes: Calendar_Clss_Set)[index].begin,
                             over: filterClassesByDate(date: 1, classes: Calendar_Clss_Set)[index].over,
                             color: filterClassesByDate(date: 1, classes: Calendar_Clss_Set)[index].color)
                }

            case "Tue":
                ForEach(filterClassesByDate(date: 2, classes: Calendar_Clss_Set).indices, id: \.self) { index in
                    DateView(name: filterClassesByDate(date: 2, classes: Calendar_Clss_Set)[index].name,
                             place: filterClassesByDate(date: 2, classes: Calendar_Clss_Set)[index].place,
                             begin: filterClassesByDate(date: 2, classes: Calendar_Clss_Set)[index].begin,
                             over: filterClassesByDate(date: 2, classes: Calendar_Clss_Set)[index].over,
                             color: filterClassesByDate(date: 2, classes: Calendar_Clss_Set)[index].color)
                }
            case "Wed":
                ForEach(filterClassesByDate(date: 3, classes: Calendar_Clss_Set).indices, id: \.self) { index in
                    DateView(name: filterClassesByDate(date: 3, classes: Calendar_Clss_Set)[index].name,
                             place: filterClassesByDate(date: 3, classes: Calendar_Clss_Set)[index].place,
                             begin: filterClassesByDate(date: 3, classes: Calendar_Clss_Set)[index].begin,
                             over: filterClassesByDate(date: 3, classes: Calendar_Clss_Set)[index].over,
                             color: filterClassesByDate(date: 3, classes: Calendar_Clss_Set)[index].color)
                }
            case "Thu":
                ForEach(filterClassesByDate(date: 4, classes: Calendar_Clss_Set).indices, id: \.self) { index in
                    DateView(name: filterClassesByDate(date: 4, classes: Calendar_Clss_Set)[index].name,
                             place: filterClassesByDate(date: 4, classes: Calendar_Clss_Set)[index].place,
                             begin: filterClassesByDate(date: 4, classes: Calendar_Clss_Set)[index].begin,
                             over: filterClassesByDate(date: 4, classes: Calendar_Clss_Set)[index].over,
                             color: filterClassesByDate(date: 4, classes: Calendar_Clss_Set)[index].color)
                }
            case "Fri":
                ForEach(filterClassesByDate(date: 5, classes: Calendar_Clss_Set).indices, id: \.self) { index in
                    DateView(name: filterClassesByDate(date: 5, classes: Calendar_Clss_Set)[index].name,
                             place: filterClassesByDate(date: 5, classes: Calendar_Clss_Set)[index].place,
                             begin: filterClassesByDate(date: 5, classes: Calendar_Clss_Set)[index].begin,
                             over: filterClassesByDate(date: 5, classes: Calendar_Clss_Set)[index].over,
                             color: filterClassesByDate(date: 5, classes: Calendar_Clss_Set)[index].color)
                }
            case "Sat":
                ForEach(filterClassesByDate(date: 6, classes: Calendar_Clss_Set).indices, id: \.self) { index in
                    DateView(name: filterClassesByDate(date: 6, classes: Calendar_Clss_Set)[index].name,
                             place: filterClassesByDate(date: 6, classes: Calendar_Clss_Set)[index].place,
                             begin: filterClassesByDate(date: 6, classes: Calendar_Clss_Set)[index].begin,
                             over: filterClassesByDate(date: 6, classes: Calendar_Clss_Set)[index].over,
                             color: filterClassesByDate(date: 6, classes: Calendar_Clss_Set)[index].color)
                }
            case "Sun":
                ForEach(filterClassesByDate(date: 7, classes: Calendar_Clss_Set).indices, id: \.self) { index in
                    DateView(name: filterClassesByDate(date: 7, classes: Calendar_Clss_Set)[index].name,
                             place: filterClassesByDate(date: 7, classes: Calendar_Clss_Set)[index].place,
                             begin: filterClassesByDate(date: 7, classes: Calendar_Clss_Set)[index].begin,
                             over: filterClassesByDate(date: 7, classes: Calendar_Clss_Set)[index].over,
                             color: filterClassesByDate(date: 7, classes: Calendar_Clss_Set)[index].color)
                }
            default:
                ForEach(filterClassesByDate(date: 0, classes: Calendar_Clss_Set).indices, id: \.self) { index in
                    DateView(name: filterClassesByDate(date: 0, classes: Calendar_Clss_Set)[index].name,
                             place: filterClassesByDate(date: 0, classes: Calendar_Clss_Set)[index].place,
                             begin: filterClassesByDate(date: 0, classes: Calendar_Clss_Set)[index].begin,
                             over: filterClassesByDate(date: 0, classes: Calendar_Clss_Set)[index].over,
                             color: filterClassesByDate(date: 0, classes: Calendar_Clss_Set)[index].color)
                }
            }

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
