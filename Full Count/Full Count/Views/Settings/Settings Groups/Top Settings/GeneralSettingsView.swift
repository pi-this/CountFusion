//
//  GeneralSettingsView.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/16/24.
//

import SwiftUI

struct GeneralSettingsView: View {
    var body: some View {
            Form {
                Section() {
                    VStack {
                        HStack {
                            NavigationLink(destination: CounterSettingsView()) {
                                Text("#️⃣ Count")
                            }
                        }
                    }
                    
                }
            }
    }
}

#Preview {
    GeneralSettingsView()
}
