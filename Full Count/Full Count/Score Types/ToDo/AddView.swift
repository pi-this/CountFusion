//
//  AddView.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/27/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TextField("Type something...", text: $textFieldText)
                        .background(Color.gray.opacity(0.1))
                        .frame(height: 55)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Button(action: {
                        saveButtonPressed()
                    }, label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                    )
                }
                .padding(14)
            }
            .navigationTitle("Add an Item 📥")
            .alert(isPresented: $showAlert) {
                getAlert()
            }
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            showAlert.toggle()
            alertTitle = "Title must be at least 3 characters long. Try Again. 🤔"
            return false
        }
        else {
            return true
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    AddView()
}
