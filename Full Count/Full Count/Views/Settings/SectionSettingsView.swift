//
//  AdvancedSettingsView.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/16/24.
//


//
//  AS_Menu.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/25/24.
//

import SwiftUI

struct SectionView<Destination: View>: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("modeWanted") var modeWanted: String = ""
    @AppStorage("modeTurned") var modeTurned: Bool = false
    @AppStorage("advancedSettings") var advancedSettings: Bool = false
    
    var destinationType: Destination
    var text: String
    
    var body: some View {
        NavigationView {
            Form {

                Section() {
                    VStack {
                        HStack {
                            NavigationLink(destination: destinationType) {
                                Text(text)
                            }
                        }
                    }
            }
            }
        }
        
    }
}

#Preview {
    SectionView(destinationType: CounterSettingsView(), text: "#️⃣ Count")
}
