//
//  ToDoListMainView.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/1/24.
//

import SwiftUI

struct ToDoListMainView: View {
    @AppStorage("insideAddedView") var insideAddedView: Bool = false
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            if insideAddedView {
                InsideAddedView(item: item)
            }
            else {
                ToDoList()
                    .environmentObject(ListViewModel())
            }
        }
    }
}
 
#Preview {
    var item: ItemModel { .init(title: "Test Item", value: 0.0) }
    ToDoListMainView(item: item)
}
