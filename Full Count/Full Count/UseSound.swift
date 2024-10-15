//
//  UseSound.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/9/24.
//

import SwiftUI

struct UseSound: View {
    @AppStorage("strikeSound") var strikeSound: Bool = true
    @AppStorage("fullCountSound") var fullCountSound: Bool = true
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
    @AppStorage("ballSound") var ballSound: Bool = true
    
    func checkSoundEnabled() {
        if soundEnabled {
            strikeSound = true
            fullCountSound = true
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Toggle("Full Count Sound: \(fullCountSound ? "On" : "Off")", isOn: $fullCountSound)
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
