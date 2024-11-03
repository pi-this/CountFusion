//
//  AddAllBy.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/3/24.
//

import SwiftUI


struct AddAllByCustomCountSettingsView: View {
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
    AddAllByCustomCountSettingsView()
}
