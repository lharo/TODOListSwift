//
//  ContentView.swift
//  todolist
//
//  Created by Luis Esteban Haro on 24/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var itemsArray = [ItemModel]()
    private var dataPersistence = DataPersistence()
//    @State private var itemsArray: [ItemModel] = ItemModel.itemModels
    @State private var showAddNewItemView = false

    var body: some View {
        VStack {
            NavigationStack {
                List(itemsArray) { item in
                    Button(action: {
                        itemsArray.removeAll { $0.id == item.id }
                    }, label: {
                        VStack(alignment: .leading) {
                            Text(item.description)
                                .font(.headline)
                            Text(item.dueDate.formatted())
                                .font(.subheadline)
                        }.foregroundColor(.primary)
                    })

                }
                .navigationBarTitle("TODO List")
                .navigationBarItems(trailing:
                    NavigationLink(destination: ItemView(handleAdd: addItem)) {
                    Image(systemName: "plus")
                })
            }
        }.onAppear{
            do {
                self.itemsArray = try dataPersistence.loadItems()
            } catch{
                
            }
        }.onDisappear {
            do {
                try dataPersistence.saveItems(itemsArray)
            } catch {
                
            }
        }

    }
    
    func addItem(item: ItemModel) -> Void {
        
//        do {
//            try dataPersistence.appendItem(item)
//        } catch {
//            // Handle error
//        }
        itemsArray.append(item)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
