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
    @AppStorage("useFavPopup") var useFavPopup: Bool = true
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    // red zone vars
    @State private var showDeleteAlert = false
    @State private var showAuthenticationError = false
    
    var body: some View {
        
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
                    message: Text("Would you like to reset all settings to thier default values?"),
                    primaryButton: .destructive(Text("Yes, Restore")) {
                        countBySheet = false
                        addAllByStr = "1"
                        useFavPopup = true
                    },
                    secondaryButton: .cancel(Text("No"))

                )
                
                
            }
            Spacer()
        }
        
        
        HStack {
            Spacer()
            Button("Delete Everything 🗑️") {
                RedZoneUtility.shared.authenticateUser { success in
                    if success {
                        DataUtility.shared.deleteEverything()
                        
                        listViewModel.items.removeAll()
                    } else {
                        showAuthenticationError = true
                    }
                }
            }
            .foregroundColor(.red)
            .alert(isPresented: $showAuthenticationError) {
                Alert(
                    title: Text("Authentication Failed"),
                    message: Text("Unable to authenticate. Please try again."),
                    dismissButton: .default(Text("OK"))
                )
            }
            Spacer()
        }
    }
}

#Preview {
    RestartSettingsView()
}
