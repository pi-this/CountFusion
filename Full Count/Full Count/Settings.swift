import SwiftUI

struct Settings: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
    @AppStorage("showStatus") var showStatus: Bool = true
    @AppStorage("scoreType") var scoreType = 1
    @State private var countBySheet = false
    @AppStorage("addAllByStr") var addAllByStr = ""
    
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
                            .edgesIgnoringSafeArea(.all)
                            
                            Button(action: {
                                addAllByStr = ".5"
                            }) {
                                Text(".5")
                            }
                            .buttonStyle(.bordered)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .edgesIgnoringSafeArea(.all)
                            Button(action: {
                                addAllByStr = "1"
                            }) {
                                Text("1")
                            }
                            .buttonStyle(.bordered)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .edgesIgnoringSafeArea(.all)
                            Button(action: {
                                addAllByStr = "2"
                            }) {
                                Text("2")
                            }
                            .buttonStyle(.bordered)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .edgesIgnoringSafeArea(.all)
                            Button(action: {
                                addAllByStr = "5"
                            }) {
                                Text("5")
                            }
                            .buttonStyle(.bordered)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .edgesIgnoringSafeArea(.all)
                            Button(action: {
                                addAllByStr = "10"
                            }) {
                                Text("10")
                            }
                            .buttonStyle(.bordered)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
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
                            .edgesIgnoringSafeArea(.all)
                            .sheet(isPresented: $countBySheet) {
                                AddAllBy()
                            }
                            Spacer()
                        }
                    }
                }
                
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
