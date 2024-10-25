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


struct restartSettings: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
    @AppStorage("showStatus") var showStatus: Bool = false
    @AppStorage("scoreType") var scoreType = 1
    @State private var countBySheet = false
    @AppStorage("addAllByStr") var addAllByStr = "1"
    @AppStorage("showFullCount") var showFullCount: Bool = false
    @AppStorage("showInningOver") var showInningOver: Bool = true
    @AppStorage("delEverything") var delEverything: Bool = false
    
    var body: some View {
        HStack {
            Spacer()
            Button( action: {
                if scoreType == 1 {
                    countBySheet = false
                    addAllByStr = "1"
                }
                else if scoreType == 2 {
                    soundEnabled = true
                    showStatus = false
                    showFullCount = false
                    showInningOver = true
                }
            }, label: {
                Text("Restart Settings")
                Image(systemName: "arrow.trianglehead.2.counterclockwise")
            })
            .buttonStyle(PlainButtonStyle())
            Spacer()
        }
        HStack {
            Spacer()
            Button("Delete Everything") {
                delEverything = true
            }
            .foregroundColor(.red)
            .alert(isPresented: $delEverything) {
                Alert(
                    title: Text("Data Reset"),
                    message: Text("All or most of your data has been cleared. Some might remain due to apple's system security."),
                    dismissButton: .default(Text("OK")) {
                        deleteEverything()
                    }
                )
                
                
            }
            Spacer()
        }
    }
}



struct Settings: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
    @AppStorage("showStatus") var showStatus: Bool = false
    @AppStorage("scoreType") var scoreType = 1
    @State private var countBySheet = false
    @AppStorage("addAllByStr") var addAllByStr = ""
    @AppStorage("showFullCount") var showFullCount: Bool = false
    @AppStorage("showInningOver") var showInningOver: Bool = true
    @AppStorage("modeWanted") var modeWanted: String = ""
    
    // 2 is baseball
    // 1 is custom

    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Score")) {
                    Picker(selection: $scoreType, label: Text("Score Type")) {
                        Text("Custom").tag(1)
                        Text("Baseball").tag(2)
                    }
                }
                
                
                
                if scoreType == 2 {
                    Section(header: Text("Sound")) {
                        Toggle("All Sounds: \(soundEnabled ? "On" : "Off")", isOn: $soundEnabled)
                        
                        if !soundEnabled {
                            NavigationLink(destination: UseSound()) {
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
                                AddAllBy()
                            }
                            Spacer()
                        }
                    }
                    
                }
                
                VStack {
                    Section(header: Text("Light or Dark Mode?")) {
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    modeWanted = "light"
                                }) {
                                    Text("Light ☀️")
                                }
                                .buttonStyle(.bordered)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .border(modeWanted == "light" ? Color.blue : .clear)
                                .edgesIgnoringSafeArea(.all)
                                
                                Button(action: {
                                    modeWanted = "dark"
                                }) {
                                    Text("Dark 🌙")
                                }
                                .buttonStyle(.bordered)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .border(modeWanted == "dark" ? Color.blue : .clear)
                                .edgesIgnoringSafeArea(.all)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Button(action: {
                                    addAllByStr = ""
                                }) {
                                    Text("Follow System Settings 📲")
                                }
                                .buttonStyle(.bordered)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .border(modeWanted  == "" ? Color.blue : .clear)
                                .edgesIgnoringSafeArea(.all)
                                Spacer()
                            }
                        }
                    }
                }
                
                restartSettings()
                
            }
        }
    }
}

struct AddAllBy: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var inputText = ""
    @AppStorage("addAllByStr") var addAllByStr = ""
    
    var body: some View {
        VStack {
            Text("Count By:")
            
            HStack {
                TextField("Add All By", text: $addAllByStr)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {
                    self.addAllByStr.removeAll()
                }) {
                    Image(systemName: "xmark.circle.fill")
                }
                .foregroundColor(Color.red)
            }
            
            Button("OK") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .foregroundColor(colorScheme == .dark ? .white : .black)
        .padding()
    }
}

#Preview {
    Settings(soundEnabled: true)
}
