

//
//
//
//  Future of Full-Count:
// Count full count, balls, strikes, outs, ...
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

struct Count : View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("balls") var balls: Int = 0
    @AppStorage("strikes") var strikes: Int = 0
    @AppStorage("fouls") var fouls: Int = 0
    @AppStorage("outs") var outs: Int = 0
    @AppStorage("displayBalls") var displayBalls = " ⃝⃝  ⃝⃝  ⃝⃝  ⃝⃝"
    @AppStorage("displayStrikes") var displayStrikes = " ⃝⃝  ⃝⃝  ⃝⃝  ⃝⃝"
    
    
    func restart() {
        balls = 0
    }
    
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(outs) out" + (outs == 1 ? "" : "s"))
                    .font(.largeTitle)
                    .bold()
                
                HStack {
                    
                    
                    Button("ball") {
                        
                        if balls == 1 {
                            displayBalls = "⚾️  ⃝⃝  ⃝⃝  ⃝⃝"
                        }
                        else if balls == 2 {
                            displayBalls = "⚾️ ⚾️  ⃝⃝  ⃝⃝"
                        }
                        else if balls == 3 {
                            displayBalls =  "⚾️ ⚾️ ⚾️  ⃝⃝"
                        }
                        else if balls == 4 {
                            displayBalls = "⚾️ ⚾️ ⚾️ ⚾️"
                        }
                        else {
                            displayBalls = " ⃝⃝  ⃝⃝  ⃝⃝  ⃝⃝"
                        }
                        
                        if balls >= 4 {
                            balls = 0
                        }
                        else {
                            balls += 1
                        }
                    
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .edgesIgnoringSafeArea(.all)
                    .padding()
                    
                    Text(displayBalls)
                    
                }
                
                
                
                
                HStack {
                    Button("strike") {
                        if strikes == 1 {
                            displayStrikes = "⚾️  ⃝⃝  ⃝⃝"
                        }
                        else if strikes == 2 {
                            displayStrikes = "⚾️ ⚾️  ⃝⃝"
                        }
                        else if strikes == 3 {
                            displayStrikes =  "⚾️ ⚾️ ⚾️"
                        }
                        else if strikes == 4 {
                            displayStrikes = "⚾️ ⚾️ ⚾️"
                        }
                        else {
                            displayStrikes = " ⃝⃝  ⃝⃝  ⃝⃝"
                        }
                        
                        if strikes >= 3 {
                            strikes = 0
                        }
                        else {
                            strikes += 1
                        }
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .edgesIgnoringSafeArea(.all)
                    .padding()
                    
                    
                    Text(displayStrikes)
                }
                
                HStack {
                    Button("foul") {
                        fouls += 1
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .edgesIgnoringSafeArea(.all)
                    .padding()
                                        
                    Text("\(fouls)")
                }
                
                
            }.preferredColorScheme(colorScheme == .dark ? .dark : .light)
        }
    }
}

#Preview {
    Count()
}
