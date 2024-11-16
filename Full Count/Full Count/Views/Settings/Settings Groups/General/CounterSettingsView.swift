//
//  CounterSettingsView.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/16/24.
//

import SwiftUI

struct CounterSettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(footer: Text("Select the increment value for counting. This setting customizes how your counts are adjusted.")) {
                        
                        VStack {
                            HStack {
                                Spacer()
                                Text("Count By...")
                                Spacer()
                            }
                        }
                        
                        CountByView()
                        
                    }
            }
        }
    }
}

#Preview {
    CounterSettingsView()
}
