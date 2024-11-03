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
                
                Section(header: Text("Score")) {
                    Picker(selection: $scoreType, label: Text("Score Type")) {
                        Text("Custom").tag(1)
                        Text("Baseball").tag(2)
                        Text("Walk").tag(3)
                    }
                }
                
                
                
                if scoreType == 2 {
                    Section(header: Text("Sound")) {
                        Toggle("All Sounds: \(soundEnabled ? "On" : "Off")", isOn: $soundEnabled)
                        
                        if !soundEnabled {
                            NavigationLink(destination: UseSoundSettingsView()) {
                                Text("Manage Sounds")
                            }
                        }
                    }
                    Section(header: Text("Status")) {
                        Toggle("Batter Status: \(showStatus ? "Show" : "Hide")", isOn: $showStatus)
                        Toggle("Full Count Alert: \(showStatus ? "Show" : "Hide")", isOn: $showFullCount)
                        Toggle("Inning Over Alert: \(showStatus ? "Show" : "Hide")", isOn: $showInningOver)
                    }
                }
                
                
                
                else if scoreType == 1 {
                    Section(header: Text("Count")) {
                        
                        VStack {
                            HStack {
                                Spacer()
                                Text("Count By...")
                                Spacer()
                            }
                        }
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                addAllByStr = ".1"
                            }) {
                                Text(".1")
                            }
                            .buttonStyle(.bordered)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .border(addAllByStr == ".1" ? Color.blue : .clear)
                            .edgesIgnoringSafeArea(.all)
                            
                            Button(action: {
                                addAllByStr = ".5"
                            }) {
                                Text(".5")
                            }
                            .buttonStyle(.bordered)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .border(addAllByStr == ".5" ? Color.blue : .clear)
                            .edgesIgnoringSafeArea(.all)
                            Button(action: {
                                addAllByStr = "1"
                            }) {
                                Text("1")
                            }
                            .buttonStyle(.bordered)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .border(addAllByStr == "1" ? Color.blue : .clear)
                            .edgesIgnoringSafeArea(.all)
                            Button(action: {
                                addAllByStr = "2"
                            }) {
                                Text("2")
                            }
                            .buttonStyle(.bordered)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .border(addAllByStr == "2" ? Color.blue : .clear)
                            .edgesIgnoringSafeArea(.all)
                            Button(action: {
                                addAllByStr = "5"
                            }) {
                                Text("5")
                            }
                            .buttonStyle(.bordered)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .border(addAllByStr == "5" ? Color.blue : .clear)
                            .edgesIgnoringSafeArea(.all)
                            Button(action: {
                                addAllByStr = "10"
                            }) {
                                Text("10")
                            }
                            .buttonStyle(.bordered)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .border(addAllByStr == "10" ? Color.blue : .clear)
                            .edgesIgnoringSafeArea(.all)
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                countBySheet = true
                            }) {
                                Text("other")
                            }
                            .buttonStyle(.bordered)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .border(addAllByStr != ".1" && addAllByStr != ".5" && addAllByStr != "1" && addAllByStr != "2" && addAllByStr != "5" && addAllByStr != "10" ? Color.blue : .clear)
                            .edgesIgnoringSafeArea(.all)
                            .sheet(isPresented: $countBySheet) {
                                AddAllByCustomCountSettingsView()
                            }
                            Spacer()
                        }
                    }
                    
                }
                
                
               else if scoreType == 3 {
                   Section(header: Text("Questions")) {
                       Toggle("Do It? (\(soundEnabled ? "On" : "Off"))", isOn: $soundEnabled)
                   }
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
