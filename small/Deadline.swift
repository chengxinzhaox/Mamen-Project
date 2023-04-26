//
//  Deadline.swift
//  Deadline
//
//  Created by Chester Zhao on 4/26/23.
//

import WidgetKit
import SwiftUI
import Intents

struct DeadlineProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> DeadlineSimpleEntry {
        DeadlineSimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (DeadlineSimpleEntry) -> ()) {
        let entry = DeadlineSimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [DeadlineSimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = DeadlineSimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct DeadlineSimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct DeadlineEntryView : View {
    
    var entry: DeadlineProvider.Entry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        HStack{
            DeadlineElementView(deadlineDate: Date(), deadlineTitle: "HCI", daysRemaining: 10)
            if family == .systemMedium {
                DeadlineElementView(deadlineDate: Date(), deadlineTitle: "DSA", daysRemaining: 15)
            }
        }
    }
}

struct DeadlineElementView: View {
    let deadlineDate: Date
    let deadlineTitle: String
    let daysRemaining: Int

    private func gradientColors() -> [Color] {
        switch daysRemaining {
        case ..<5:
            return [Color(hex: "#FFBFBF"), Color(hex: "#FE859D")]
        case 5 ... 10:
            return [Color(hex: "#FF9777"), Color(hex: "#FFC484")]
        default:
            return [Color(hex: "C8E8AE"), Color(hex: "83E2F0")]
        }
    }

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(.gray, lineWidth: 10)
                    .rotationEffect(Angle(degrees: -90.0))
                    .opacity(0.4)
                    .padding()
                Circle()
                    .trim(from: 1.0 - CGFloat(Double(daysRemaining) / 20.0), to: 1.0)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: gradientColors()),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(lineWidth: 10.0, lineCap: .round)
                    )
                    .rotationEffect(Angle(degrees: -90.0))
                    .padding()
                VStack {
                    Image(systemName: "calendar")
                        .font(.headline)
                        .fontWeight(.medium)
                    Spacer()
                        .frame(height: 5)
                    Text(deadlineTitle)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text("\(daysRemaining) Day")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                }
                .offset(y:5)
            }
            .frame(width: 150)
        }
    }
}

struct Deadline: Widget {
    let kind: String = "Deadline"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: DeadlineProvider()) { entry in
            DeadlineEntryView(entry: entry)
        }
        .configurationDisplayName("Deadline")
        .description("You can use this widget to view your list of deadlines. The small widget only displays the nearest deadline, while the medium widget can display two.").supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct Deadline_Previews: PreviewProvider {
    static var previews: some View {
        DeadlineEntryView(entry: DeadlineSimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

