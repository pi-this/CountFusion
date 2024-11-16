//
//  FavoriteSettingsView.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/16/24.
//

import SwiftUI

struct FavoriteSettingsView: View {
    @AppStorage("useFavPopup") var useFavPopup: Bool = true
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Favorite") , footer: Text("Toggle to show or hide the favorite notification. Only one favorite item can be displayed on the widget. This feature is enabled by default.")) {
                    VStack {
                        Toggle(isOn: $useFavPopup) {
                            Text("Ask for favorite toggle")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FavoriteSettingsView()
}
