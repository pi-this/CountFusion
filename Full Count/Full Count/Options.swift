//
//  CenterStage.swift
//  FTC Points
//
//  Created by Wesley Chastain on 5/10/24.
//


import SwiftUI

struct Options: View {
    @AppStorage ("inningType") var inningType = "top"
    @AppStorage ("runsHome") var runsHome: Int = 0
    @AppStorage ("runsAway") var runsAway: Int = 0
    @AppStorage ("inning") var inning: Double = 0
    
    func restart() {
        inningType = "top"
        runsHome = 0
        runsAway = 0
        inning = 1
    }

    
    var body: some View {
        ZStack {
            Color(.black)
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
                    
                    
                    HStack {
                        Text("Home:")
                        Text("\(runsHome)")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    HStack {
                        Text("Away:")
                        Text("\(runsAway)")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    HStack {
                        Text("Inning:")
                        Text(String(Int(inning)))
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("(\(inningType))")
                            .font(.subheadline)
                            .fontWeight(.light)
                    }
                    
                    
                    // Innings
                    HStack {
                        Image(systemName: "baseball.diamond.bases").foregroundColor(.white)
                            .scaleEffect(1.4)
                        Text("Innings")
                            .font(.headline)
                            .fontWeight(.black)
                            .padding()
                        
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
                            
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.white)
                        .background(.green)
                        .edgesIgnoringSafeArea(.all)
                        
                    }
                    
                    
                    
                    // Home
                    Text("Home")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.gray)
                        .padding()
                    
                    // Runs
                    HStack {
                        Image(systemName: "figure.run").foregroundColor(.white)
                            .scaleEffect(1.4)
                        Text("Runs")
                            .font(.headline)
                            .fontWeight(.black)
                            .padding()
                        
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
                    Text("Away")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.gray)
                        .padding()
                    
                    // Runs
                    HStack {
                        Image(systemName: "figure.run").foregroundColor(.white)
                            .scaleEffect(1.4)
                        Text("Runs")
                            .font(.headline)
                            .fontWeight(.black)
                            .padding()
                        
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
                    .foregroundColor(.white)
                    .edgesIgnoringSafeArea(.all)
                    .padding()
                    .padding()
                }
            }
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    Options()
}
