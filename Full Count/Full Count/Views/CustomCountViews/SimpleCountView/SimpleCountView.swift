//
//  SimPlainCount.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/16/24.
//

import SwiftUI

struct SimpleCountView: View {
    @AppStorage("simPlainNum") var simPlainNum:Double = 0
    @AppStorage("addAllByStr") var addAllByStr = ""
    
    func formatNumber(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 10
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Spacer()
                Button("-") {
                    simPlainNum -= Double(addAllByStr) ?? 1
                }
                .buttonStyle(.bordered)
                .foregroundColor(.red)
                .edgesIgnoringSafeArea(.all)
                .border(Color.red)
                Spacer()
                Text("\(formatNumber(simPlainNum))")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
                
                Button("+") {
                    simPlainNum += Double(addAllByStr) ?? 1
                }
                .buttonStyle(.bordered)
                .foregroundColor(.green)
                .edgesIgnoringSafeArea(.all)
                .border(Color.green)
                Spacer()
                Spacer()
            }
            HStack {
                Button("clear") {
                    simPlainNum = 0
                }
                .buttonStyle(.bordered)
                .foregroundColor(.orange)
                .edgesIgnoringSafeArea(.all)
                .border(Color.yellow)
            }
            Spacer()
        }
    }
}

#Preview {
    SimpleCountView()
}
