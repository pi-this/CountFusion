//
//  InsideAddedView.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/1/24.
//

import SwiftUI

struct InsideCountSpaceView: View {
    @State var title: String = "Hello, World!"
    @State var value: String = ""
    @AppStorage("insideAddedView") var insideAddedView: Bool = false
    @AppStorage("currentTitle") var currentTitle: String = ""
    @AppStorage("currentValue") var currentValue: Double = 0
    
    let item: ItemModel
    
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
            
            
            Text("\(formatNumber(currentValue))")
                .font(.title)
            
            HStack {
                // use this for future addition of specific amounts
                Spacer()
                TextField("Add a Specific Amount", text: $value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                Spacer()
            }
            
            HStack {
                // use this for future subtraction of specific amounts
                Spacer()
                TextField("Subtract a Specific Amount", text: $value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                Spacer()
            }
            
            
            
            Spacers(amount: 3)
            
            
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
    var item: ItemModel { .init(title: "Test Item", value: 0.0) }
    InsideCountSpaceView(item: item)
}
