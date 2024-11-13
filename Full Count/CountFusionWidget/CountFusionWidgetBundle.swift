//
//  CountFusionWidgetBundle.swift
//  CountFusionWidget
//
//  Created by Wesley Chastain on 11/6/24.
//

import WidgetKit
import SwiftUI

func updateWidgetValue(newValue: String) {
    let sharedDefaults = UserDefaults(suiteName: "com.wesleychastainC.Full-Count.CountFusionWidget")
    sharedDefaults?.set(newValue, forKey: "widgetValue")
    WidgetCenter.shared.reloadAllTimelines()
}


@main
struct CountFusionWidgetBundle: WidgetBundle {
    var body: some Widget {
        CountFusionWidget()
        CountFusionWidgetControl()
        CountFusionWidgetLiveActivity()
    }
}
