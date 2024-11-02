//
//  ListCountView.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/29/24.
//

import SwiftUI

struct ListCountView: View {
    
    var item: CountSpaceModel
    
    func formatNumber(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 10
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
    
    
    
    var body: some View {
        HStack {
            Text("\(item.title)")
                .fontWeight(.bold)
            Spacer()
            Text("\(formatNumber(item.value))")
            Spacer()
            
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}
