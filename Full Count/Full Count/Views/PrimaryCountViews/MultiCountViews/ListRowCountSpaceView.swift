//
//  ListRowView.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/27/24.
//

import SwiftUI

struct ListRowCountSpaceView: View {

    let item: CountSpaceItemModel
    
    var body: some View {
        HStack {
            Text(item.title)
            Text(item.value.formatted())
                .bold()
                .padding()
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    var item: CountSpaceItemModel { .init(title: "Test Item", value: 0.0, favorite: false) }
    ListRowCountSpaceView(item: item)
}
