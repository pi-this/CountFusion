//
//  ToDoList.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/27/24.
//

import SwiftUI
import WidgetKit

struct CountSpaceView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @AppStorage("insideAddedView") var insideAddedView: Bool = false
    @AppStorage("currentTitle") var currentTitle: String = ""
    @AppStorage("currentValue") var currentValue: Double = 0.0
    @State var deleteAllItemsAlert: Bool = false
    @AppStorage("useFavPopup") var useFavPopup: Bool = true
    
    @AppStorage("favorite") var favorite = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @AppStorage("count", store: UserDefaults(suiteName: "group.groupCountFusion.com.wesleychastainC.Full-Count")) var count: Double = 0
    
    @AppStorage("countTitle", store: UserDefaults(suiteName: "group.groupCountFusion.com.wesleychastainC.Full-Count")) var countTitle: String = "Count"
    
    @State var markHeartPresent: Bool = false
    

    func favSet() {
        if favorite == currentTitle {
            count = currentValue
            countTitle = currentTitle
            // Update the AppStorage value
            let sharedDefaults = UserDefaults(suiteName: "group.groupCountFusion.com.wesleychastainC.Full-Count")
            sharedDefaults?.set(count, forKey: "count")
            sharedDefaults?.set(countTitle, forKey: "countTitle")
            // Refresh widget timelines
            WidgetCenter.shared.reloadAllTimelines()
        }
    }

    
    var body: some View {
        NavigationView {
            ZStack {

                if listViewModel.items.isEmpty {
                    NoCountSpaceItemsView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                }
                // only show list if there are items
                else {
                    List {
                        Button("Delete all counters.") {
                            deleteAllItemsAlert = true
                        }
                        .foregroundStyle(Color.red)
                        .alert(isPresented: $deleteAllItemsAlert) {
                            Alert(
                                title: Text("Delete All Counters"),
                                message: Text("Delete All Counters"),
                                primaryButton: .destructive(Text("Yes, delete")) {
                                    listViewModel.deleteAllItems()
                                },
                                secondaryButton: .cancel()
                                
                            )
                            
                            
                        }
                        ForEach(listViewModel.items) { item in // does not need , id: \.self because the model has an id inside
                            HStack {
                                ListRowCountSpaceView(item: item)
                                    .onTapGesture {
                                        withAnimation(.linear) {
                                            currentTitle = item.title
                                            currentValue = item.value
                                            insideAddedView = true
                                        }
                                    }
                                
                                Text("➖")
                                    .onTapGesture {
                                        listViewModel.updateItemSubtract(item: item)
                                }
                                Spacers(amount: 3)
                                Text("➕")
                                    .onTapGesture{
                                        listViewModel.updateItemAdd(item: item)
                                    }
                                    .padding(.horizontal, 5)
                                
                                
                                HStack {
                                    ZStack {
                                        Circle()
                                            .frame(width: 30, height: 50)
                                            .foregroundColor(.fadeGray)
                                            .blur(radius: 3)
                                            .padding()
                                        Button(favorite == item.title ? "❤️" : "♡") {
                                            if favorite == item.title {
                                                if useFavPopup {
                                                    markHeartPresent = false
                                                }
                                                else {
                                                    favorite = item.title
                                                }
                                            }
                                            else {
                                                markHeartPresent = true
                                            }
                                            
                                        }
                                        .font(.system(size: favorite == item.title ? 15 : 20))
                                        .alert(isPresented: $markHeartPresent) {
                                            Alert(
                                                title: Text("Set as Favorite?"),
                                                message: Text("Only one favorite item is allowed at a time. This will be displayed on your widget."),
                                                primaryButton: .destructive(Text("Confirm")) {
                                                    favorite = item.title
                                                },
                                                secondaryButton: .cancel()
                                            )

                                            
                                            
                                        }
                                        .padding(2)
                                    }
                                    
                                    

                                }
                                .padding(.horizontal, 2)
                            }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                        
                        
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Counters")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("Add", destination: AddCountSpaceView()))
        }
    }
}

#Preview {
    CountSpaceView()
        .environmentObject(ListViewModel())
}
