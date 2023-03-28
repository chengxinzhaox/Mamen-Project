//
//  CalendarView.swift
//  Mamen Watch Watch App
//
//  Created by Chester Zhao on 3/28/23.
//

import SwiftUI

struct CalendarView: View {
    @State var Calendar_Clss_Set = [
        Calendar_class(date: 1, name: "C&C++", place: "8103", begin: "8:00AM", over: "9:45AM", color: Color(hex: "98E2D3")),
        Calendar_class(date: 1, name: "HCI", place: "6A203", begin: "10:00AM", over: "11:45AM", color: Color(hex: "CCC8EF")),
        Calendar_class(date: 2, name: "WAD", place: "8201", begin: "10:00AM", over: "11:45AM", color: Color(hex: "C8E8AE")),
        Calendar_class(date: 3, name: "C&C++", place: "8403", begin: "8:00AM", over: "9:45AM", color: Color(hex: "98E2D3")),
        Calendar_class(date: 3, name: "DataBase", place: "8403", begin: "2:30PM", over: "4:45AM", color: Color(hex: "FF927F")),
        Calendar_class(date: 4, name: "CSS&HTML", place: "6A101", begin: "8:00AM", over: "9:45AM", color: Color(hex: "9FECEC")),
        Calendar_class(date: 4, name: "HCI", place: "6A201", begin: "10:00AM", over: "11:45AM", color: Color(hex: "CCC8EF")),
        Calendar_class(date: 5, name: "DataBase", place: "8203", begin: "8:00AM", over: "9:45AM", color: Color(hex: "FF927F"))
    ]

    var body: some View {
        List {
            Section("MONDAY") {
                ForEach(filterClassesByDate(date: 1, classes: Calendar_Clss_Set).indices, id: \.self) { index in
                    CalendarElement(color: filterClassesByDate(date: 1, classes: Calendar_Clss_Set)[index].color,
                                    name: filterClassesByDate(date: 1, classes: Calendar_Clss_Set)[index].name,
                                    begin: filterClassesByDate(date: 1, classes: Calendar_Clss_Set)[index].begin,
                                    over: filterClassesByDate(date: 1, classes: Calendar_Clss_Set)[index].over,
                                    location: filterClassesByDate(date: 1, classes: Calendar_Clss_Set)[index].place)
                }
            }
            Section("TUESDAY") {
                ForEach(filterClassesByDate(date: 2, classes: Calendar_Clss_Set).indices, id: \.self) { index in
                    CalendarElement(color: filterClassesByDate(date: 2, classes: Calendar_Clss_Set)[index].color,
                                    name: filterClassesByDate(date: 2, classes: Calendar_Clss_Set)[index].name,
                                    begin: filterClassesByDate(date: 2, classes: Calendar_Clss_Set)[index].begin,
                                    over: filterClassesByDate(date: 2, classes: Calendar_Clss_Set)[index].over,
                                    location: filterClassesByDate(date: 2, classes: Calendar_Clss_Set)[index].place)
                }
            }
            Section("WEDNESDAY") {
                ForEach(filterClassesByDate(date: 3, classes: Calendar_Clss_Set).indices, id: \.self) { index in
                    CalendarElement(color: filterClassesByDate(date: 3, classes: Calendar_Clss_Set)[index].color,
                                    name: filterClassesByDate(date: 3, classes: Calendar_Clss_Set)[index].name,
                                    begin: filterClassesByDate(date: 3, classes: Calendar_Clss_Set)[index].begin,
                                    over: filterClassesByDate(date: 3, classes: Calendar_Clss_Set)[index].over,
                                    location: filterClassesByDate(date: 3, classes: Calendar_Clss_Set)[index].place)
                }
            }
            Section("THURSDAY") {
                ForEach(filterClassesByDate(date: 4, classes: Calendar_Clss_Set).indices, id: \.self) { index in
                    CalendarElement(color: filterClassesByDate(date: 4, classes: Calendar_Clss_Set)[index].color,
                                    name: filterClassesByDate(date: 4, classes: Calendar_Clss_Set)[index].name,
                                    begin: filterClassesByDate(date: 4, classes: Calendar_Clss_Set)[index].begin,
                                    over: filterClassesByDate(date: 4, classes: Calendar_Clss_Set)[index].over,
                                    location: filterClassesByDate(date: 4, classes: Calendar_Clss_Set)[index].place)
                }
            }
            Section("FRIDAY") {
                ForEach(filterClassesByDate(date: 5, classes: Calendar_Clss_Set).indices, id: \.self) { index in
                    CalendarElement(color: filterClassesByDate(date: 5, classes: Calendar_Clss_Set)[index].color,
                                    name: filterClassesByDate(date: 5, classes: Calendar_Clss_Set)[index].name,
                                    begin: filterClassesByDate(date: 5, classes: Calendar_Clss_Set)[index].begin,
                                    over: filterClassesByDate(date: 5, classes: Calendar_Clss_Set)[index].over,
                                    location: filterClassesByDate(date: 5, classes: Calendar_Clss_Set)[index].place)
                }
            }
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

struct CalendarElement: View {
    var color: Color
    var name: String
    var begin: String
    var over: String
    var location: String

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 5, height: 35)
                .foregroundColor(color)
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.caption)
                        .fontWeight(.medium)
                        .lineLimit(.max)
                    Text(location)
                        .font(.footnote)
                        .fontWeight(.medium)
                        .lineLimit(.max)
                }
                Spacer()
                VStack {
                    Text(begin)
                        .font(.footnote)
                        .foregroundColor(.gray)

                    Text(over)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct Calendar_class {
    var date: Int
    var name: String
    var place: String
    var begin: String
    var over: String
    var color: Color

    init(date: Int, name: String, place: String, begin: String, over: String, color: Color) {
        self.date = date
        self.name = name
        self.place = place
        self.begin = begin
        self.over = over
        self.color = color
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
