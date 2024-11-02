//
//  AS_Menu.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/25/24.
//

import SwiftUI

struct AS_Menu: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("modeWanted") var modeWanted: String = ""
    @AppStorage("modeTurned") var modeTurned: Bool = false
    @AppStorage("advancedSettings") var advancedSettings: Bool = false
    var body: some View {
        Section(header: Text("Light or Dark Mode?")) {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        modeWanted = "light"
                        modeTurned = true
                    }) {
                        Text("Light ☀️")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .border(modeWanted == "light" ? Color.blue : .clear)
                    .edgesIgnoringSafeArea(.all)
                    
                    Button(action: {
                        modeWanted = "dark"
                        modeTurned = true
                    }) {
                        Text("Dark 🌙")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .border(modeWanted == "dark" ? Color.blue : .clear)
                    .edgesIgnoringSafeArea(.all)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button(action: {
                        modeWanted = ""
                        modeTurned = true
                    }) {
                        Text("Follow System Settings 📲")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .border(modeWanted  == "" ? Color.blue : .clear)
                    .edgesIgnoringSafeArea(.all)
                    Spacer()
                }
            }
            .alert(isPresented: $modeTurned) {
                Alert(
                    title: Text("Mode Changed"),
                    message: Text("In order for it to apply you need to restart the app."),
                    dismissButton: .default(Text("OK")) {}
                )
                
                
        }
    }
    }
}

#Preview {
    AS_Menu()
}
