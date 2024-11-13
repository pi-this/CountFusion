//
//  SimPlainCount.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/16/24.
//

import SwiftUI
import WidgetKit

struct SimpleCountView: View {
    @AppStorage("simPlainNum") var simPlainNum:Double = 0
    @AppStorage("addAllByStr") var addAllByStr = ""
    @AppStorage("favorite") var favorite = ""
    
    @AppStorage("count", store: UserDefaults(suiteName: "group.groupCountFusion.com.wesleychastainC.Full-Count")) var count: Double = 0
    
    @AppStorage("countTitle", store: UserDefaults(suiteName: "group.groupCountFusion.com.wesleychastainC.Full-Count")) var countTitle: String = "Count"
    
    func formatNumber(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 10
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
    @State var markHeartPresent: Bool = false
    
    func favSet() { // insures that the widget is only updated with this if it is a favorite
        if favorite == "simpleCount" {
            count = simPlainNum
            countTitle = "Simple Count"
            // Ensure the AppStorage value is updated
            let sharedDefaults = UserDefaults(suiteName: "group.groupCountFusion.com.wesleychastainC.Full-Count")
            sharedDefaults?.set(count, forKey: "count")
            sharedDefaults?.set(countTitle, forKey: "countTitle")
            // Reload widget timelines
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
    
    var body: some View {
        VStack {
            
                HStack {
                    Spacer()
                    Button(favorite == "simpleCount" ? "❤️" : "♡") {
                        if favorite == "simpleCount" {
                            markHeartPresent = false
                        }
                        else {
                            markHeartPresent = true
                        }
                        
                    }
                    .font(.system(size: favorite == "simpleCount" ? 15 : 20))
                    .alert(isPresented: $markHeartPresent) {
                        Alert(
                            title: Text("Mark as Favorite?"),
                            primaryButton: .destructive(Text("Yes")) {
                                favorite = "simpleCount"
                                
                            },
                            secondaryButton: .cancel()
                            
                        )
                        
                        
                    }
                    .padding(2)

                }
                .padding(.horizontal, 25)
                    

            Spacer()
            HStack {
                Spacer()
                Spacer()
                Button("-") {
                    simPlainNum -= Double(addAllByStr) ?? 1
                    favSet()
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
                    favSet()
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
                    favSet()
                }
                .buttonStyle(.bordered)
                .foregroundColor(.orange)
                .edgesIgnoringSafeArea(.all)
                .border(Color.yellow)
            }
            Spacer()
        }
        
        
    }
    
    func saveCount() {
        UserDefaults(suiteName: "com.wesleychastainC.Full-Count.CountFusionWidget")?.set(count, forKey: "count")
    }
}

#Preview {
    SimpleCountView()
}
