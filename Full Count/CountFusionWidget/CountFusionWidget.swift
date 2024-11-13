//
//  CountFusionWidget.swift
//  CountFusionWidget
//
//  Created by Wesley Chastain on 11/6/24.
//

import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let value: String
}

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), value: "Placeholder")
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        let value = UserDefaults(suiteName: "group.groupCountFusion.com.wesleychastainC.Full-Count")?.string(forKey: "widgetValue") ?? "Default Value"
        return SimpleEntry(date: Date(), configuration: configuration, value: value)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        let value = UserDefaults(suiteName: "group.groupCountFusion.com.wesleychastainC.Full-Count")?.string(forKey: "widgetValue") ?? "Default Value"
        
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, value: value)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}



func formatNumber(_ number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 10
    formatter.numberStyle = .decimal
    return formatter.string(from: NSNumber(value: number)) ?? ""
}

struct CountFusionWidgetEntryView : View {
    @AppStorage("count", store: UserDefaults(suiteName: "group.groupCountFusion.com.wesleychastainC.Full-Count")) var count: Double = 0
    
    @AppStorage("countTitle", store: UserDefaults(suiteName: "group.groupCountFusion.com.wesleychastainC.Full-Count")) var countTitle: String = "Count"

    var entry: SimpleEntry

    var body: some View {
        VStack {
            // Text("Time:")
            // Text(entry.date, style: .time)

            // Text("Favorite Emoji:")
            // Text(entry.configuration.favoriteEmoji)
            
            Text(countTitle)
            Text("\(formatNumber(count))")
                .font(.largeTitle)
                

        }
    }
}

struct CountFusionWidget: Widget {
    let kind: String = "Display Count"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            CountFusionWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Display Count")
        .description("Displays the count that the user selects in the app.")
        .supportedFamilies([.systemSmall]) // Only supporting small and medium sizes
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    CountFusionWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley, value: "0")
    SimpleEntry(date: .now, configuration: .starEyes, value: "0")
}
