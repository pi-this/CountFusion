//
//  ToDoList.swift
//  Full Count
//
//  Created by Wesley Chastain on 10/27/24.
//

import SwiftUI

struct ToDoList: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @AppStorage("insideAddedView") var insideAddedView: Bool = false
    @AppStorage("currentTitle") var currentTitle: String = ""
    @AppStorage("currentValue") var currentValue: Double = 0.0
    
    var body: some View {
        NavigationView {
            ZStack {
                if listViewModel.items.isEmpty {
                     NoItemsView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                }
                // only show list if there are items
                else {
                    List {
                        ForEach(listViewModel.items) { item in // does not need , id: \.self because the model has an id inside
                            HStack {
                                ListRowView(item: item)
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
                    NavigationLink("Add", destination: AddView()))
        }
    }
}

#Preview {
    ToDoList()
        .environmentObject(ListViewModel())
}

