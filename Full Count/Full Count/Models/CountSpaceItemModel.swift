//
//  ItemModel.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/27/24.
//

import Foundation

// this is an immutable struct
struct CountSpaceItemModel: Identifiable, Codable {
    let id: String
    var title: String
    var value: Double
    // keep all these lets so that there are no accedents to making the date here different than it is any place else. Making it so they cannot be changed on the fly. Only be changed through the function of updateCompleation to make code clean and consise.
    
    init(id: String = UUID().uuidString, title: String, value: Double) {
        self.id = id // with id with string manual or auto create one
        self.title = title
        self.value = value
    }
    
    func addToValue() -> CountSpaceItemModel {
        return CountSpaceItemModel(id: id, title: title, value: value+1)
    }
    
    mutating func addToValue(amount: Double) {
        self.value += amount
    }
    
    mutating func updateTitle(newTitle: String) {
        self.title = newTitle
    }
    
    func subtractToValue() -> CountSpaceItemModel {
        return CountSpaceItemModel(id: id, title: title, value: value-1)
    }
}



// ItemModel(title: "Hello", isCompleated: true) <-- used when creating new items
// ItemModel(id: "1", title: "Hello", isCompleated: true) <-- used when editing items (compleate or not) used because we already have an id.
