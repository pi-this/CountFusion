//
//  AppIntent.swift
//  CountFusionWidget
//
//  Created by Wesley Chastain on 11/6/24.
//

import WidgetKit
import AppIntents
import SwiftUI

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    @AppStorage("count") var count: Double = 0
    
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "Widget for displaying the value of the simple count." }

    // An example configurable parameter.
    @Parameter(title: "Count Space Item", default: "Chosen from the app")
    
    var favoriteEmoji: String
}
