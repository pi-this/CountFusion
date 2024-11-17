//
//  SettingsView 2.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/17/24.
//


import SwiftUI

struct SettingsView2: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    NavigationLink(destination: GeneralSettingsView2()) {
                        Text("⚙️ General")
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
                
                Section(header: Text("Preferences")) {
                    NavigationLink(destination: PreferencesSettingsView2()) {
                        Text("🤔 Preferences")
                            .padding()
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
                
                Section(header: Text("Appearance")) {
                    NavigationLink(destination: AppearanceSettingsView2()) {
                        Text("🖥️ Appearance")
                            .padding()
                            .background(Color.orange.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct GeneralSettingsView2: View {
    var body: some View {
        Text("General Settings")
            .navigationBarTitle("General Settings", displayMode: .inline)
    }
}

struct PreferencesSettingsView2: View {
    var body: some View {
        Text("Preferences Settings")
            .navigationBarTitle("Preferences Settings", displayMode: .inline)
    }
}

struct AppearanceSettingsView2: View {
    var body: some View {
        Text("Appearance Settings")
            .navigationBarTitle("Appearance Settings", displayMode: .inline)
    }
}


#Preview {
    SettingsView2()
}
