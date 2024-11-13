//
//  CountFusionWidgetLiveActivity.swift
//  CountFusionWidget
//
//  Created by Wesley Chastain on 11/6/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct CountFusionWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct CountFusionWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CountFusionWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension CountFusionWidgetAttributes {
    fileprivate static var preview: CountFusionWidgetAttributes {
        CountFusionWidgetAttributes(name: "World")
    }
}

extension CountFusionWidgetAttributes.ContentState {
    fileprivate static var smiley: CountFusionWidgetAttributes.ContentState {
        CountFusionWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: CountFusionWidgetAttributes.ContentState {
         CountFusionWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: CountFusionWidgetAttributes.preview) {
   CountFusionWidgetLiveActivity()
} contentStates: {
    CountFusionWidgetAttributes.ContentState.smiley
    CountFusionWidgetAttributes.ContentState.starEyes
}
