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
    
    
    // 2 is baseball
    // 1 is custom
    // 3 is To Do

    var body: some View {
        NavigationView {
            Form {
                
                    Section(header: Text("Count")) {
                        
                        VStack {
                            HStack {
                                Spacer()
                                Text("Count By...")
                                Spacer()
                            }
                        }
                        
                        CountByView()
                        
                    }

                
                
                Section(header: Text("Advanced Settings")) {
                    VStack {
                        NavigationLink(destination: AdvancedSettingsView()) {
                            Text("Open")
                        }
                    }
                }
                
                
                RestartSettingsView()
                
            }
        }
    }
}

#Preview {
    SettingsView(soundEnabled: true)
}
