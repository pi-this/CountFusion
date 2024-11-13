//
//  AddView.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/27/24.
//

import SwiftUI

struct AddCountSpaceView: View {
    @Environment(\.colorScheme) var colorScheme
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
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        
                    
                    Button(action: {
                        saveButtonPressed()
                    }, label: {
                        Text("Save".uppercased())
                            .foregroundColor(colorScheme == .dark ? .black : .white)
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
        if textFieldText.trimmingCharacters(in: .whitespaces).isEmpty {
            showAlert.toggle()
            alertTitle = "Oops! You forgot to type something. 📝"
            return false
        } else if listViewModel.doesTitleExist(textFieldText.trimmingCharacters(in: .whitespaces)){
            showAlert.toggle()
            alertTitle = "Oops! That title is already taken. 🫤"
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
    AddCountSpaceView()
        .environmentObject(ListViewModel())
}
