//
//  GeneralSettingsView 2.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/16/24.
//


//
//  GeneralSettingsView.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/16/24.
//

import SwiftUI

struct PreferencesSettingsView: View {
    var body: some View {
            Form {
                Section() {
                    
                    VStack {
                        HStack {
                            NavigationLink(destination: FavoriteSettingsView()) {
                                Text("❤️ Favorite and Widget")
                            }
                        }
                    }
                    
                    VStack {
                        HStack {
                            NavigationLink(destination: AnimationSettingsView()) {
                                Text("🚙 Animation")
                            }
                        }
                    }
                    
                }
            }
    }
}

#Preview {
    PreferencesSettingsView()
}
