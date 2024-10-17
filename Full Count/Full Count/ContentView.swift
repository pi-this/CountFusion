//
//  ContentView.swift
//  FTC Points
//
//  Created by Wesley Chastain on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("tabView") var tabView: Int = 1
    @AppStorage("scoreType") var scoreType = 1
    var body: some View {
        
        // 1 is custom
        // 2 is baseball
        
        if scoreType == 1 {
            ZStack {
                TabView(selection: $tabView) {
                    SimPlainCount()
                        .tabItem {
                            Image(systemName: "numbers")
                            Text("Simple Count")
                                .onSubmit {
                                    tabView = 1
                                }
                        }
                        .tag(1)
                    SimCount()
                        .tabItem {
                            Image(systemName: "numbers")
                            Text("Multi-Count")
                                .onSubmit {
                                    tabView = 2
                                }
                        }
                        .tag(2)
                    Settings()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                                .onSubmit {
                                    tabView = 3
                                }
                        }
                        .tag(3)
                }
            }
            
        }
        
        else if scoreType == 2 {
            ZStack {
                TabView(selection: $tabView) {
                    Runs()
                        .tabItem {
                            Image(systemName: "figure.run")
                            Text("Runs")
                                .onSubmit {
                                    tabView = 1
                                }
                        }
                        .tag(1)
                    TheCount()
                        .tabItem {
                            Image(systemName: "baseball")
                            Text("Count")
                                .onSubmit {
                                    tabView = 2
                                }
                        }
                        .tag(2)
                    Settings()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                                .onSubmit {
                                    tabView = 3
                                }
                        }
                        .tag(3)
                }
            }
        }
        }
    }


#Preview {
    ContentView()
}
