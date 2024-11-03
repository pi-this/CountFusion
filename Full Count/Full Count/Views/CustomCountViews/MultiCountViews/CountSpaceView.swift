//
//  ToDoList.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/27/24.
//

import SwiftUI

struct CountSpaceView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @AppStorage("insideAddedView") var insideAddedView: Bool = false
    @AppStorage("currentTitle") var currentTitle: String = ""
    @AppStorage("currentValue") var currentValue: Double = 0.0
    @State var deleteAllItemsAlert: Bool = false
    
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
                                Spacers(amount: 5)
                                Text("➕")
                                    .onTapGesture{
                                        listViewModel.updateItemAdd(item: item)
                                    }
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

