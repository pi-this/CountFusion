//
//  SwiftUIView.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/6/24.
//

import SwiftUI

struct TopTitle: View {
    var body: some View {
        // opens game title text and displays points
            HStack {
                
                Image(systemName: "figure.baseball")
                    .foregroundColor(Color.blue)
                    .scaleEffect(1.8)
                    .padding()
                
                    
                Text("Let's Play Ball!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                .foregroundColor(Color.orange)
            }
            .padding()
    }
}

#Preview {
    TopTitle()
}
