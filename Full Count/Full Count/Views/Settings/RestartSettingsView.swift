//
//  restartSettings.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/3/24.
//

import SwiftUI

struct RestartSettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
    @AppStorage("showStatus") var showStatus: Bool = false
    @AppStorage("scoreType") var scoreType = 1
    @State private var countBySheet = false
    @AppStorage("addAllByStr") var addAllByStr = "1"
    @AppStorage("showFullCount") var showFullCount: Bool = false
    @AppStorage("showInningOver") var showInningOver: Bool = true
    @AppStorage("delEverything") var delEverything: Bool = false
    @AppStorage("showRestoreSettingsAlert") var showRestoreSettingsAlert: Bool = false
    @AppStorage("showRestoreAllSettingsAlert") var showRestoreAllSettingsAlert: Bool = false
    
    var body: some View {
        HStack {
            Spacer()
            Button( action: {
                showRestoreSettingsAlert = true
            }, label: {
                Text("Restore Score Settings")
                Image(systemName: "arrow.trianglehead.2.counterclockwise")
            })
            .buttonStyle(PlainButtonStyle())
            .alert(isPresented: $showRestoreSettingsAlert) {
                Alert(
                    title: Text("Restore Settings"),
                    message: Text("Would you like to reset all settings for this score type to their default values?"),
                    primaryButton: .destructive(Text("Yes, Restore")) {
                        if scoreType == 1 {
                            countBySheet = false
                            addAllByStr = "1"
                        }
                        else if scoreType == 2 {
                            soundEnabled = true
                            showStatus = false
                            showFullCount = false
                            showInningOver = true
                        }
                    },
                    secondaryButton: .cancel(Text("No"))

                )
                
                
            }
            Spacer()
        }
        
        HStack {
            Spacer()
            Button( action: {
                showRestoreAllSettingsAlert = true
            }, label: {
                Text("Restore All Settings")
                Image(systemName: "arrow.trianglehead.2.counterclockwise")
            })
            .buttonStyle(PlainButtonStyle())
            .alert(isPresented: $showRestoreAllSettingsAlert) {
                Alert(
                    title: Text("Restore All Settings"),
                    message: Text("Would you like to reset all settings for this score type to their default values?"),
                    primaryButton: .destructive(Text("Yes, Restore")) {
                        if scoreType == 1 {
                            countBySheet = false
                            addAllByStr = "1"
                        }
                        else if scoreType == 2 {
                            soundEnabled = true
                            showStatus = false
                            showFullCount = false
                            showInningOver = true
                        }
                    },
                    secondaryButton: .cancel(Text("No"))

                )
                
                
            }
            Spacer()
        }
        
        
        HStack {
            Spacer()
            Button("Delete Everything 🗑️") {
                delEverything = true
            }
            .foregroundColor(.red)
            .alert(isPresented: $delEverything) {
                Alert(
                    title: Text("Reset Complete"),
                    message: Text("All saved data has been cleared, and settings have been reset to their defaults."),
                    dismissButton: .default(Text("OK")) {
                        deleteEverything()
                    }

                )
                
                
            }
            Spacer()
        }
    }
}

#Preview {
    RestartSettingsView()
}
