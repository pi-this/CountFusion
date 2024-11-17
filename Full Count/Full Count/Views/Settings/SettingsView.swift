import SwiftUI

func clearCustomData() {
    let fileManager = FileManager.default
    if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
        do {
            let files = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)
            for file in files {
                try fileManager.removeItem(at: file)
            }
        } catch {
            print("Could not clear custom data: \(error)")
        }
    }
}


func clearAppCaches() {
    let fileManager = FileManager.default
    if let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first {
        do {
            let files = try fileManager.contentsOfDirectory(at: cacheDirectory, includingPropertiesForKeys: nil)
            for file in files {
                try fileManager.removeItem(at: file)
            }
        } catch {
            print("Could not clear cache files: \(error)")
        }
    }
}

func deleteEverything() {
    let domain = Bundle.main.bundleIdentifier!
    UserDefaults.standard.removePersistentDomain(forName: domain)
    UserDefaults.standard.synchronize()
    
    
    // clear Cache:
    URLCache.shared.removeAllCachedResponses() // this like could be added other places to be done more often so less storage can be used.
    
    clearCustomData()
    clearAppCaches()
    
}


struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
    @AppStorage("showStatus") var showStatus: Bool = false
    @AppStorage("scoreType") var scoreType = 1
    @State private var countBySheet = false
    @AppStorage("addAllByStr") var addAllByStr = ""
    @AppStorage("showFullCount") var showFullCount: Bool = false
    @AppStorage("showInningOver") var showInningOver: Bool = true
    @AppStorage("useFavPopup") var useFavPopup: Bool = true
    @AppStorage("introAnimation") var introAnimation: Bool = true
    
    
    @State private var searchText = ""
    @State private var settings = ["General", "Preferences", "Appearance", "About & Help", "Count", "Favorite and Widget", "Animation"]
    
    var filteredSettings: [String] { settings.filter { setting in searchText.isEmpty || setting.lowercased().contains(searchText.lowercased()) } }

    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    SearchBar(text: $searchText, placeholder: "Search Settings")
                    
                    if !searchText.isEmpty {
                        Section () {
                            List(filteredSettings, id: \.self) { setting in
                                if setting == "Count" {
                                    SectionSettingsView(destinationType: CounterSettingsView(), text: "#️⃣ Count")
                                }
                                else if setting == "Favorite and Widget" {
                                    SectionSettingsView(destinationType: FavoriteSettingsView(), text: "❤️ Favorite and Widget")
                                }
                                else if setting == "Animation" {
                                    SectionSettingsView(destinationType: AnimationSettingsView(), text: "🚙 Animation")
                                }
                                else if setting == "General" {
                                    SectionSettingsView(destinationType: GeneralSettingsView(), text: "⚙️ General")
                                }
                                else if setting == "Preferences" {
                                    SectionSettingsView(destinationType: PreferencesSettingsView(), text: "🤔 Preferences")
                                }
                                else if setting == "Appearance" {
                                    SectionSettingsView(destinationType: AppearanceSettingsView(), text: "🖥️ Appearance")
                                }
                                else if setting == "About & Help" {
                                    SectionSettingsView(destinationType: AppearanceSettingsView(), text: "🖥️ Appearance")
                                }
                            }
                        }
                    }
                }
                
                
                
                
                
                
                Section {
                    NavigationLink(destination: GeneralSettingsView()) {
                        Text("⚙️ General")
                    }
                    
                    NavigationLink(destination: PreferencesSettingsView()) {
                        Text("🤔 Preferences")
                    }
                    
                    NavigationLink(destination: AppearanceSettingsView()) {
                        Text("🖥️ Appearance")
                    }
                    
                }
                .navigationBarTitle("Settings")
                
                
                
                
            }
            RestartSettingsView()
            
        }
    }
}

#Preview {
    SettingsView(soundEnabled: true)
}
