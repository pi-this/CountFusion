//
//  MyWidgetConfiguration.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/7/24.
//


import Foundation
import Combine

class MyWidgetConfiguration: ObservableObject {
    @Published var value: String = "Initial Value"
    
    func updateValue(newValue: String) {
        value = newValue
        objectWillChange.send()
    }
}
