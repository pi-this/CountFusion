//
//  NoItemsView.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/2/24.
//

import SwiftUI

struct NoItemsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack {
                Text("No items found!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Your count space is currently empty.")
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AddView()) {
                    Text("Start Counting")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor,
                    radius: 10,
                    x: 0.0,
                    y: animate ? 30 : 10
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        // make sure animate is not true don't go through with this
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }
}
