//
//  ContentView.swift
//  FTC Points
//
//  Created by Wesley Chastain on 5/10/24.
//
/*
 Next steps:
 watch video more. (// I left off: https://youtu.be/nwpmWu1SP1k?t=1228)
1. Find out how to do the save the list model to app storage. Do that.
2. Modify InsideAddedView to make it so there is specific adding and subtracting.
3. Do further modifications to add emogies and such to do finishing touches and tests.
 (rename from To-Do List to Multi-Count ofcourse.)
 get more specific with items that can and cannot be added.
 or less specific, just do finishing touches.
 
 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
 
 take away ToDo view and on settings only make the custom one.
KEEP IS THIS SIMPLE FOR FIRST VERSION RELEASE. MAKE SURE TO FOCUS ON SIMPLIFING ALOT!!!
 */
import SwiftUI

struct ContentView: View {
    @State private var showIcon = true
    @State private var showText = false
    @State private var textOffset: CGFloat = -UIScreen.main.bounds.width
    @State private var isVisible = true
    
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("tabView") var tabView: Int = 1
    @AppStorage("scoreType") var scoreType = 1
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
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
                                textOffset = -15
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
        // 3 is To Do
        
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
                    var item: ItemModel { .init(title: "Test Item", value: 0.0) }
                    ToDoListMainView(item: item)
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
        
        
        else if scoreType == 3 && !isVisible {
            ZStack {
                TabView(selection: $tabView) {
                    ToDoList()
                        .tabItem {
                            Image(systemName: "list.bullet.clipboard")
                            Text("List View")
                                .onSubmit {
                                    tabView = 1
                                }
                        }
                        .environmentObject(listViewModel)
                        .tag(1)
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
