//
//  GeneralSettingsView 3.swift
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

struct AppearanceSettingsView: View {
    var body: some View {
        NavigationView {
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
}

#Preview {
    AppearanceSettingsView()
}
