//
//  ToDoListMainView.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/1/24.
//

import SwiftUI

struct CountSpaceMainView: View {
    @AppStorage("insideAddedView") var insideAddedView: Bool = false
    
    let item: CountSpaceItemModel
    
    var body: some View {
        HStack {
            if insideAddedView {
                InsideCountSpaceView(item: item)
            }
            else {
                CountSpaceView()
                    .environmentObject(ListViewModel())
            }
        }
    }
}
 
#Preview {
    var item: CountSpaceItemModel { .init(title: "Test Item", value: 0.0, favorite: false) }
    CountSpaceMainView(item: item)
        .environmentObject(ListViewModel())
}
