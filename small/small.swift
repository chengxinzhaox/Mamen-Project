//
//  small.swift
//  small
//
//  Created by Chester Zhao on 1/10/23.
//

import Intents
import SwiftUI
import WidgetKit

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct smallEntryView: View {
    var entry: Provider.Entry
    
    private let calendar = Calendar.current
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        let today = Date()
        let weekDay = calendar.component(.weekday, from: today)

        HStack {
            VStack {
                HStack {
                    Text(weekdayString(weekDay))
                        .font(.system(size: 11))
                        .fontWeight(.bold)
                        .foregroundColor(Color("main-green"))
                    Spacer()
                }
                HStack {
                    Text(currentDate())
                        .font(.system(size: 29))
                        .fontWeight(.medium)
                        .opacity(0.6)
                    Spacer()
                }
                Spacer()
                ExtractedView(name: "DB", place: "8203", color: Color(hex: "FF927F"))
                ExtractedView(name: "HCI", place: "8606", color: Color(hex: "CCC8EF"))
                Spacer()
            }
            .padding([.top, .leading])
            .padding(.bottom, 25)
            if family == .systemMedium {
                VStack {
                    Spacer()
                        .frame(height: 15)
                    HStack {
                        Text("MONDAY")
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    ExtractedView(name: "C&C++", place: "8103", color: Color(hex: "98E2D3"))
                    ExtractedView(name: "HCI", place: "8606", color: Color(hex: "CCC8EF"))
                    
                    HStack {
                        Text("TUESDAY")
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.top, 5)
                    HStack {
                        Text("1 class today")
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct small: Widget {
    let kind: String = "small"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            smallEntryView(entry: entry)
        }
        .configurationDisplayName("Calendar")
        .description("You can view your schedule through this widget, choosing a medium-sized widget will allow you to see more classes.").supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct small_Previews: PreviewProvider {
    static var previews: some View {
        smallEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

private func weekdayString(_ weekday: Int) -> String {
    switch weekday {
    case 2:
        return "MONDAY"
    case 3:
        return "TUESDAY"
    case 4:
        return "WEDNESDAY"
    case 5:
        return "THURSDAY"
    case 6:
        return "FRIDAY"
    case 7:
        return "SATURDAY"
    case 1:
        return "SUNDAY"
    default:
        return ""
    }
}

func currentDate() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "d"
    let datetime = formatter.string(from: Date())
    return datetime
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

struct ExtractedView: View {
    var name: String
    var place: String
    var color: Color

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 21, style: .continuous)
                .frame(width: 5, height: 28)
                .foregroundColor(color)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 13))
                    .fontWeight(.semibold)
                Text(place)
                    .font(.system(size: 10))
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.bottom, -2)
    }
}
