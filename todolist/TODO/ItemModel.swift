//
//  ItemModel.swift
//  todolist
//
//  Created by Luis Esteban Haro on 24/04/23.
//

import Foundation

struct ItemModel: Identifiable {
    let id = UUID()
    let dueDate: Date
    let description: String
}

extension ItemModel {
    static let itemModels = [
        ItemModel(dueDate: Date(), description: "Buy groceries"),
        ItemModel(dueDate: Date().addingTimeInterval(3600), description: "Pay bills"),
        ItemModel(dueDate: Date().addingTimeInterval(86400), description: "Go for a run")
    ]
}
