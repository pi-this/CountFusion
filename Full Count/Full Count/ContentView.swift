//
//  ContentView.swift
//  FTC Points
//
//  Created by Wesley Chastain on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showIcon = true
    @State private var showText = false
    @State private var textOffset: CGFloat = -UIScreen.main.bounds.width
    @State private var isVisible = true
    
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("tabView") var tabView: Int = 1
    @AppStorage("scoreType") var scoreType = 1
    
    var body: some View {
        
        ZStack {
                HStack {
                    Spacer()
                    Spacer()
                    if showIcon {
                        Image("CountFusionLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .transition(.opacity)
                            .cornerRadius(12)
                            .padding()
                    }
                    Spacer()
                    if showText {
                        Text("CountFusion")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.blue)
                            .offset(x: textOffset)
                        
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 1)) {
                            showIcon = true
                        }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.easeIn(duration: 1)) {
                                showText = true
                                textOffset = 0
                            }
                            
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                withAnimation(.easeOut(duration: 1)) {
                                    isVisible = false
                                }
                            }
                        }
                        
        }
        
        
        
        // 1 is custom
        // 2 is baseball
        
        if scoreType == 1 && !isVisible {
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
                            Image(systemName: "list.number")
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
        
        else if scoreType == 2 && !isVisible {
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
