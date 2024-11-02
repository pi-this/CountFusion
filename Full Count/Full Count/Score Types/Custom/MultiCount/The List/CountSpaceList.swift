//
//  CountSpaceList.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/29/24.
//


import Foundation


class CountSpaceList: ObservableObject {
    @Published var items: [CountSpaceModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            CountSpaceModel(title: "Title", value: 0),
            CountSpaceModel(title: "$", value: 12.54),
            CountSpaceModel(title: "Rocks", value: 32)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = CountSpaceModel(title: title, value: 0)
        items.append(newItem)
    }
}
