//
//  CountByView.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/4/24.
//

import SwiftUI

struct CountByView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
    @AppStorage("showStatus") var showStatus: Bool = false
    @AppStorage("scoreType") var scoreType = 1
    @State private var countBySheet = false
    @AppStorage("addAllByStr") var addAllByStr = ""
    @AppStorage("showFullCount") var showFullCount: Bool = false
    @AppStorage("showInningOver") var showInningOver: Bool = true
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                addAllByStr = ".1"
            }) {
                Text(".1")
            }
            .buttonStyle(.bordered)
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .border(addAllByStr == ".1" ? Color.blue : .clear)
            .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                addAllByStr = ".5"
            }) {
                Text(".5")
            }
            .buttonStyle(.bordered)
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .border(addAllByStr == ".5" ? Color.blue : .clear)
            .edgesIgnoringSafeArea(.all)
            Button(action: {
                addAllByStr = "1"
            }) {
                Text("1")
            }
            .buttonStyle(.bordered)
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .border(addAllByStr == "1" ? Color.blue : .clear)
            .edgesIgnoringSafeArea(.all)
            Button(action: {
                addAllByStr = "2"
            }) {
                Text("2")
            }
            .buttonStyle(.bordered)
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .border(addAllByStr == "2" ? Color.blue : .clear)
            .edgesIgnoringSafeArea(.all)
            Button(action: {
                addAllByStr = "5"
            }) {
                Text("5")
            }
            .buttonStyle(.bordered)
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .border(addAllByStr == "5" ? Color.blue : .clear)
            .edgesIgnoringSafeArea(.all)
            Button(action: {
                addAllByStr = "10"
            }) {
                Text("10")
            }
            .buttonStyle(.bordered)
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .border(addAllByStr == "10" ? Color.blue : .clear)
            .edgesIgnoringSafeArea(.all)
            Spacer()
        }
        
        HStack {
            Spacer()
            Button(action: {
                countBySheet = true
            }) {
                Text("other")
            }
            .buttonStyle(.bordered)
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .border(addAllByStr != ".1" && addAllByStr != ".5" && addAllByStr != "1" && addAllByStr != "2" && addAllByStr != "5" && addAllByStr != "10" ? Color.blue : .clear)
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $countBySheet) {
                AddAllByCustomCountSettingsView()
            }
            Spacer()
        }
    }
}

#Preview {
    CountByView()
}
