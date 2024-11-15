//
//  NoItemsView.swift
//  Full Count
//
//  Created by Wesley Chastain on 11/2/24.
//


import SwiftUI

struct NoCountSpaceItemsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    @State private var grow = false
    @State private var showText = false
    @State private var hiddenBucket = false
    @State private var degrees: Double = 0
    @State private var isRotated = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("No items found!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Your count space is currently empty.")
                    .padding(.bottom, 20)
   
                    NavigationLink(destination: AddCountSpaceView()) {
                        Text("Start Counting")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(colorScheme == .dark ? .black : .white)
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
                    .padding(.bottom, 200)
                
                
                
                
                if !hiddenBucket {
                    Text("🪣")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .rotationEffect(Angle(degrees: degrees)) // Rotate the text by the value of degrees
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1)) {
                                self.degrees = 180 // Rotate the text to 180 degrees
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Wait for the rotation animation to complete
                                withAnimation(.easeInOut(duration: 1)) {
                                    self.isRotated.toggle()
                                    self.showText = true // Show "Start Counting" text
                                }
                                withAnimation(.easeInOut(duration: 1)) {
                                    self.hiddenBucket = true
                                }
                            }
                        }
                        .padding(.bottom, 45)
                }

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
        NoCountSpaceItemsView()
            .navigationTitle("Title")
    }
}
