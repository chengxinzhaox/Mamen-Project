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

    var body: some View {
        VStack {
            HStack {
                Text("TUESDAY")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                Spacer()
            }
            HStack {
                Text("07/01")
                    .font(.title)
                    .fontWeight(.medium)
                Spacer()
            }
            .padding(.bottom, -2)
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 21, style: .continuous)
                    .frame(width: 5, height: 25)
                    .foregroundColor(.cyan)
                VStack(alignment: .leading) {
                    Text("DB")
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text("8403")
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
                Spacer()
            }

            .padding(.bottom, -2)
            HStack {
                RoundedRectangle(cornerRadius: 21, style: .continuous)
                    .frame(width: 5, height: 25)
                    .foregroundColor(.pink)
                VStack(alignment: .leading) {
                    Text("HCI")
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text("8403")
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.vertical, -2.5)
            HStack {
                Text("3 other course")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                Spacer()
            }
        }
        .padding([.top, .leading])
        .padding(.bottom, 12)
    }
}

struct small: Widget {
    let kind: String = "small"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            smallEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct small_Previews: PreviewProvider {
    static var previews: some View {
        smallEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
