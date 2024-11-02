//
//  UseSound.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/9/24.
//

import SwiftUI

struct UseSound: View {
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
    @AppStorage("strikeSound") var strikeSound: Bool = true
    @AppStorage("foulBallSound") var foulBallSound: Bool = true
    @AppStorage("ballSound") var ballSound: Bool = true
    
    func checkSoundEnabled() {
        if soundEnabled {
            strikeSound = true
            foulBallSound = true
            ballSound = true
        }
        else {
            strikeSound = false
            foulBallSound = false
            ballSound = false
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Toggle("Foul Sound: \(foulBallSound ? "On" : "Off")", isOn: $foulBallSound)
                    .onAppear() {
                        checkSoundEnabled()
                    }
                Toggle("Strike Sound: \(strikeSound ? "On" : "Off")", isOn: $strikeSound)
                Toggle("Ball Sound: \(ballSound ? "On" : "Off")", isOn: $ballSound)
                
            }
            
        }
    }
}

#Preview {
    UseSound()
}
