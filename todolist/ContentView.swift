//
//  ContentView.swift
//  todolist
//
//  Created by Luis Esteban Haro on 24/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var itemsArray: [ItemModel] = ItemModel.itemModels
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
                        }.foregroundColor(.black)
                    })

                }
                .navigationBarTitle("TODO List")
                .navigationBarItems(trailing: NavigationLink(destination: ItemView(handleAdd: addItem)) {
                    Image(systemName: "plus")
                })
            }
        }
    }
    
    func addItem(item: ItemModel) -> Void {
        itemsArray.append(item)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
