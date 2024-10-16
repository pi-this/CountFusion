import SwiftUI

struct SimCount: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var counters: [Counter] = [Counter(name: "Name", value: 0)]
    @State private var currentCounter: Counter?
    @State private var showPromptSubtract = false
    @State private var showPromptAdd = false
    @State private var showPromptNumber = false
    @State private var showPromptName = false
    @AppStorage("addAllByStr") var addAllByStr = ""
    
    
    var body: some View {
        ZStack {
            VStack {
                Form {
                    ForEach($counters, id: \.id) { $counter in
                        Section(header: Text("Count")) {
                            HStack {
                                Stepper(value: $counter.value, in: -1_000_000...1_000_000, step: Double(addAllByStr) ?? 1) {
                                    Button("\(counter.name)") {
                                        currentCounter = counter
                                        showPromptName = true
                                    }
                                    .sheet(isPresented: $showPromptNumber) {
                                        if let currentCounter = currentCounter, let counterIndex = counters.firstIndex(where: { $0.id == currentCounter.id }) {
                                            ChangeNumber(counter: $counters[counterIndex])
                                        }
                                    }
                                    .buttonStyle(.bordered)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                    .edgesIgnoringSafeArea(.all)
                                }
                                
                                Button("\(formatNumber(counter.value))") {
                                    currentCounter = counter
                                    showPromptNumber = true
                                }
                                .sheet(isPresented: $showPromptName) {
                                    if let currentCounter = currentCounter, let counterIndex = counters.firstIndex(where: { $0.id == currentCounter.id }) {
                                        ChangeName(counter: $counters[counterIndex])
                                    }
                                }
                                .buttonStyle(.bordered)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .edgesIgnoringSafeArea(.all)
                                
                                Button(action: {
                                    currentCounter = counter
                                    counter.value = 0
                                }) {
                                    Image(systemName: "arrow.uturn.backward")
                                }
                                .buttonStyle(.bordered)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .background(Color.red)
                                .cornerRadius(5)
                                .edgesIgnoringSafeArea(.all)
                            }
                            
                            HStack {
                                Spacer()
                                Button("-") {
                                    currentCounter = counter
                                    showPromptSubtract = true
                                }
                                .sheet(isPresented: $showPromptSubtract) {
                                    if let currentCounter = currentCounter, let counterIndex = counters.firstIndex(where: { $0.id == currentCounter.id }) {
                                        Subtract(counter: $counters[counterIndex])
                                    }
                                }
                                .buttonStyle(.bordered)
                                .foregroundColor(.red)
                                .edgesIgnoringSafeArea(.all)
                                .border(Color.red)
                                Spacer()
                                
                                Button("+") {
                                    currentCounter = counter
                                    showPromptAdd = true
                                }
                                .sheet(isPresented: $showPromptAdd) {
                                    if let currentCounter = currentCounter, let counterIndex = counters.firstIndex(where: { $0.id == currentCounter.id }) {
                                        Add(counter: $counters[counterIndex])
                                    }
                                }
                                .buttonStyle(.bordered)
                                .foregroundColor(.green)
                                .edgesIgnoringSafeArea(.all)
                                .border(Color.green)
                                Spacer()
                            }
                        }
                        
                    }
                    HStack {
                        Button(action: {
                            counters.append(Counter(name: "Name", value: 0))
                        }) {
                            Image(systemName: "plus.circle")
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .background(Color.clear)
                        .border(Color.green)
                        .cornerRadius(5)
                        .edgesIgnoringSafeArea(.all)

                        Spacer()
                        Text("←    Add Count Space")
                        Spacer()
                        Spacer()
                    }
                }
                .padding()
            }
        }
    }

    func formatNumber(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 10
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
}

struct Counter: Identifiable {
    let id = UUID()
    var name: String
    var value: Double
}

struct ChangeName: View {
    @Binding var counter: Counter
    @Environment(\.presentationMode) var presentationMode
    @State private var inputText = ""

    var body: some View {
        VStack {
            Text("Enter a Name")
                .font(.headline)
            TextField("Enter a number", text: $inputText)
                .keyboardType(.default)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("OK") {
                self.presentationMode.wrappedValue.dismiss()
                counter.name = inputText
            }
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct ChangeNumber: View {
    @Binding var counter: Counter
    @Environment(\.presentationMode) var presentationMode
    @State private var inputText = ""

    var body: some View {
        VStack {
            Text("Enter an Amount")
                .font(.headline)
            TextField("Enter a number", text: $inputText)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("OK") {
                self.presentationMode.wrappedValue.dismiss()
                counter.value = Double(inputText) ?? 0.0
            }
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct Subtract: View {
    @Binding var counter: Counter
    @Environment(\.presentationMode) var presentationMode
    @State private var inputText = ""

    var body: some View {
        VStack {
            Text("Enter Amount to Subtract")
                .font(.headline)
            TextField("Enter a number", text: $inputText)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("OK") {
                self.presentationMode.wrappedValue.dismiss()
                counter.value -= Double(inputText) ?? 0.0
            }
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct Add: View {
    @Binding var counter: Counter
    @Environment(\.presentationMode) var presentationMode
    @State private var inputText = ""

    var body: some View {
        VStack {
            Text("Enter Amount to Add")
                .font(.headline)
            TextField("Enter a number", text: $inputText)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("OK") {
                self.presentationMode.wrappedValue.dismiss()
                counter.value += Double(inputText) ?? 0.0
            }
        }
        .foregroundColor(.white)
        .padding()
    }
}

#Preview {
    SimCount()
}
