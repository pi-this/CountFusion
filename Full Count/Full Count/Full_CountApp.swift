//
//  Full_CountApp.swift
//  Full Count
//
//  Created by Wesley Chastain on 5/13/24.
//

import SwiftUI

@main
struct Full_CountApp: App {
    @AppStorage("modeWanted") var modeWanted: String = ""
    init() {
        // Enforce mode wanted in the app
        if modeWanted == "dark" {
            UIView.appearance().overrideUserInterfaceStyle = .dark
        }
        else if modeWanted == "light" {
            UIView.appearance().overrideUserInterfaceStyle = .light
        }
    }
     
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
