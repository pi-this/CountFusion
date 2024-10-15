import SwiftUI

struct Settings: View {
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
    @AppStorage("showStatus") var showStatus: Bool = true
    @AppStorage("scoreType") var scoreType = 1
    @AppStorage("addAllByStr") var addAllByStr = ""
    
    // 1 is baseball
    // 2 is custom

    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Score")) {
                    Picker(selection: $scoreType, label: Text("Score Type")) {
                        Text("Baseball").tag(1)
                        Text("Custom").tag(2)
                    }
                }
                
                
                
                if scoreType == 1 {
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
                    }
                }
                
                
                
                else if scoreType == 2 {
                    Section(header: Text("Count")) {
                        
                        HStack {
                            Text("Count By:")
                            TextField("Add All By", text: $addAllByStr)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    Settings(soundEnabled: true)
}
