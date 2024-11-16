//
//  ContentView.swift
//  FTC Points
//
//  Created by Wesley Chastain on 5/10/24.
//
/*
 
 !!!! The crash is just a #Preview issue not app issue. !!!!
 Fix in preview click the diagnostics button to see the issue.
 
 
 
 
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
    
    @State private var animateGradient = false
    
    @AppStorage("introAnimation") var introAnimation: Bool = true
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.blue, .teal, .green, .yellow]),
            startPoint: animateGradient ? .topLeading : .bottomTrailing,
            endPoint: animateGradient ? .bottomTrailing : .topLeading
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(Animation.linear(duration: 5.0)) {
                self.animateGradient.toggle()
            }
        }
        
        .overlay(
            
            
            VStack {
                
                // intro animation
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
                    if introAnimation {
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
                    else {
                        showIcon = true
                        showText = true
                        textOffset = -15
                        isVisible = false
                    }
                                
                }
                
                if !isVisible {
                    ZStack {
                        TabView(selection: $tabView) {
                            SimpleCountView()
                                .tabItem {
                                    Image(systemName: "numbers")
                                    Text("Simple Count")
                                        .onSubmit {
                                            tabView = 1
                                        }
                                }
                                .tag(1)
                            var item: CountSpaceItemModel { .init(title: "Test Item", value: 0.0, favorite: false) }
                            CountSpaceMainView(item: item)
                                .tabItem {
                                    Image(systemName: "list.number")
                                    Text("Multi-Count")
                                        .onSubmit {
                                            tabView = 2
                                        }
                                }
                                .tag(2)
                            SettingsView()
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
                .padding()
                .background(colorScheme == .dark ? Color.black.opacity(0.8) : Color.white.opacity(0.8))
                .cornerRadius(10)

            
        )
    }
}


#Preview {
    ContentView()
        .environmentObject(ListViewModel())
}
