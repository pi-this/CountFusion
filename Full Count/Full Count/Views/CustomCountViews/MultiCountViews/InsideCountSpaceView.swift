//
//  InsideAddedView.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/1/24.
//

import SwiftUI

struct InsideCountSpaceView: View {
    @State var newTitle: String = ""
    @State var valueAdd: String = ""
    @State var valueSubtract: String = ""
    @AppStorage("insideAddedView") var insideAddedView: Bool = false
    @AppStorage("currentTitle") var currentTitle: String = ""
    @AppStorage("currentValue") var currentValue: Double = 0
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var item: CountSpaceItemModel
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        
        VStack {
            HStack {
                Button("← Back") {
                    insideAddedView = false
                }
                Spacer()
            }
            
            Text("\(currentTitle)")
                .font(.largeTitle)
                .padding()
            
            
            Text("\(formatNumber(currentValue))")
                .font(.title)
                .padding()
            
            
            HStack {
                // use this for subtraction of specific amounts
                Spacers(amount: 3)
                TextField("Change the display name", text: $newTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                Button("📝") {
                    if textIsAppropriate() {
                        listViewModel.updateItemTitle(currentTitle: currentTitle, newTitle: newTitle)
                        insideAddedView = false
                    }
                }
                .font(.title)
                .buttonStyle(.bordered)
                .foregroundColor(.blue)
                .edgesIgnoringSafeArea(.all)
                .border(Color.blue)
                Spacers(amount: 7)
            }
            
            
            HStack {
                // use this for addition of specific amounts
                Spacers(amount: 3)
                TextField("Add a Specific Amount", text: $valueAdd)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                Button("+") {
                    if let doubleValue = Double(valueAdd) {
                        listViewModel.updateItemAdd(title: currentTitle, amount: doubleValue)
                        insideAddedView = false
                    }
                    
                }
                .font(.title)
                .buttonStyle(.bordered)
                .foregroundColor(.green)
                .edgesIgnoringSafeArea(.all)
                .border(Color.green)
                Spacers(amount: 7)
            }
            
            HStack {
                // use this for subtraction of specific amounts
                Spacers(amount: 3)
                TextField("Subtract a Specific Amount", text: $valueSubtract)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                Button("-") {
                    if let doubleValue = Double(valueSubtract) {
                        listViewModel.updateItemAdd(title: currentTitle, amount: -doubleValue)
                        insideAddedView = false
                    }
                }
                .font(.title)
                .buttonStyle(.bordered)
                .foregroundColor(.red)
                .edgesIgnoringSafeArea(.all)
                .border(Color.red)
                Spacers(amount: 7)
            }
  
            
            
            Spacers(amount: 3)
            
            
        }
        
        
        
        
    }
    
    func textIsAppropriate() -> Bool {
        if newTitle.trimmingCharacters(in: .whitespaces).isEmpty {
            showAlert.toggle()
            alertTitle = "Oops! You forgot to type something. 📝"
            return false
        } else if listViewModel.doesTitleExist(newTitle.trimmingCharacters(in: .whitespaces)){
            showAlert.toggle()
            alertTitle = "Oops! That title is already taken. 🫤"
            return false
        }
        else {
           return true
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



struct Spacers: View {
    var amount: Int = 1
    var body : some View {
        ForEach(1...amount, id: \.self) { _ in
            Spacer()
        }
    }
}

#Preview {
    var item: CountSpaceItemModel { .init(title: "Test Item", value: 0.0) }
    InsideCountSpaceView(item: item)
}
