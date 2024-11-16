//
//  FavoriteSettingsView 2.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/16/24.
//


//
//  FavoriteSettingsView.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/16/24.
//

import SwiftUI

struct AnimationSettingsView: View {
    @AppStorage("introAnimation") var introAnimation: Bool = true
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Favorite") , footer: Text("Enable this option to display an introductory animation when the app starts. This is enabled by default.")) {
                    VStack {
                        Toggle(isOn: $introAnimation) {
                            Text("Wait for intro animation")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AnimationSettingsView()
}
