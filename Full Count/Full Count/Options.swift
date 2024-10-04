


//
//  CenterStage.swift
//  FTC Points
//
//  Created by Wesley Chastain on 5/10/24.
//


//
//
//
//  Future of Full-Count:
//  1. Add more languages than just english
//  2. Add sounds to the buttons
//  3. Add name of teams in input box
//  4. Add text ability to text friends the score
//  5. Add camera ability to take pictures or videos of the key plays
//
//
//
//

import SwiftUI

struct Options: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("inningType") var inningType = "top"
    @AppStorage("inningEnd") var inningEnd = "st"
    @AppStorage("runsHome") var runsHome: Int = 0
    @AppStorage("runsAway") var runsAway: Int = 0
    @AppStorage("inning") var inning: Double = 1
    
    func restart() {
        inningType = "top"
        runsHome = 0
        runsAway = 0
        inning = 1
        inningEnd = "st"
    }

    
    var body: some View {
        ZStack {
            
            VStack {
                // opens game title text and displays points
                    HStack {
                        
                        Image(systemName: "figure.baseball")
                            .foregroundColor(Color.blue)
                            .scaleEffect(1.8)
                            .padding()
                        
                            
                        Text("Let's Play Ball!")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        .foregroundColor(Color.orange)
                    }
                
                
            
                
                ScrollView {
                    
     
                    
                     
                    
                    // Innings
                    
                    // Away
                    Text("Innings 🧢")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .padding()
                    
                    HStack {

                        Text("\(inningType) of the \(Int(inning))\(inningEnd)")
                            .font(.headline)
                            .fontWeight(.black)

                    }
                    
                    HStack {
                        Button("-") {
                            inning -= 0.5
                            if inning < 1 {
                                inning = 1
                            }
                            if inning-Double(Int(inning)) == 0 {
                                inningType = "top"
                            }
                            else {
                                inningType = "bottom"
                            }
                            
                            
                            if Int(inning) == 1 {
                                inningEnd = "st"
                            }
                            else if Int(inning) == 2 {
                                inningEnd = "nd"
                            }
                            else if Int(inning) == 3 {
                                inningEnd = "rd"
                            }
                            else {
                                inningEnd = "th"
                            }
                            
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.white)
                        .background(.red)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        Button("+") {
                            inning += 0.5
                            if inning-Double(Int(inning)) == 0 {
                                inningType = "top"
                            }
                            else {
                                inningType = "bottom"
                            }
                            
                            if Int(inning) == 1 {
                                inningEnd = "st"
                            }
                            else if Int(inning) == 2 {
                                inningEnd = "nd"
                            }
                            else if Int(inning) == 3 {
                                inningEnd = "rd"
                            }
                            else {
                                inningEnd = "th"
                            }
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.white)
                        .background(.green)
                        .edgesIgnoringSafeArea(.all)
                    }
                    
                    
                    
                    // Home
                    Text("Home 🏠 ")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .padding()
                    
                    // Runs
                    HStack {
                        Text("🏃 \(runsHome) Run\(runsHome == 1 ? "" : "s" )")
                            .font(.headline)
                            .fontWeight(.black)
                    }
                    
                    HStack {
                        Button("-") {
                            runsHome -= 1
                            if runsHome < 0 {
                                runsHome = 0
                            }
                            
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.white)
                        .background(.red)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        Button("+") {
                            runsHome += 1
                            
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.white)
                        .background(.green)
                        .edgesIgnoringSafeArea(.all)
                    }
                    
                    
                    // Away
                    Text("Away ⚾️")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .padding()
                    
                    // Runs
                    HStack {
                        Text("🏃 \(runsAway) Run\(runsAway == 1 ? "" : "s" )")
                            .font(.headline)
                            .fontWeight(.black)
                    }
                    
                    HStack {
                        Button("-") {
                            runsAway -= 1
                            if runsAway < 0 {
                                runsAway = 0
                            }
                            
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.white)
                        .background(.red)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        Button("+") {
                            runsAway += 1
                            
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.white)
                        .background(.green)
                        .edgesIgnoringSafeArea(.all)
                    }
                }
                
                // Clear All/Redo All
                HStack {
                    Button("Restart") {
                        restart()
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .edgesIgnoringSafeArea(.all)
                    .padding()
                    .padding()
                }
            }
        }.preferredColorScheme(colorScheme == .dark ? .dark : .light)
    }
}

#Preview {
    Options()
}
