//
//  ListViewModel.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/27/24.
//
  
import Foundation
import SwiftUI
import WidgetKit


class ListViewModel: ObservableObject {
    @AppStorage("addAllByStr") var addAllByStr = ""
    @Published var items: [CountSpaceItemModel] = [] {
        didSet {
            saveItem()
        } // any time we change/effect the array this gets called
    }
    
    @Published var selectedCountSpace: String?
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([CountSpaceItemModel].self, from: data)
        else { return } // guard data because it could be an empty list model (optional)
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func deleteItem(index: Int) {
        items.remove(at: index)
    }
    
    func saveSelectedCountSpace(_ countSpace: String) { UserDefaults.standard.set(countSpace, forKey: "SelectedCountSpace"); selectedCountSpace = countSpace // Trigger widget update
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    
    // New function to delete all items
    func deleteAllItems() {
        items.removeAll()
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = CountSpaceItemModel(title: title, value: 0.0, favorite: false)
        items.append(newItem)
    }

    
    func updateItemAdd(item: CountSpaceItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.addToValue(addAmount: Double(addAllByStr) ?? 1)
        }
    }
    
    func updateItemTitle(currentTitle: String, newTitle: String) { if let index = items.firstIndex(where: { $0.title == currentTitle }) { items[index].updateTitle(newTitle: newTitle) } }
    
    func newFavorite(title: String) {
            if let index = items.firstIndex(where: { $0.title == title }) {
                items[index].newFavorite(fav: true)
            }
        }
    
    func updateItemAdd(title: String, amount: Double) {
            if let index = items.firstIndex(where: { $0.title == title }) {
                items[index].addToValue(amount: amount)
            }
        }
    
    func updateItemSubtract(item: CountSpaceItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.subtractToValue(addAmount: Double(addAllByStr) ?? 1)
        }
    }
    
    // New function to check if a title exists in the items list
    func doesTitleExist(_ title: String) -> Bool {
        return items.contains(where: { $0.title.lowercased() == title.lowercased() })
    }
    
    // sense we are in a class we can't use @AppStorage it is better to use user defults
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
