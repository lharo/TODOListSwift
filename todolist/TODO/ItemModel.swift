//
//  ItemModel.swift
//  todolist
//
//  Created by Luis Esteban Haro on 24/04/23.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: UUID
    let dueDate: Date
    let description: String
}

extension ItemModel {
    static let itemModels = [
        ItemModel(id: UUID(), dueDate: Date(), description: "Buy groceries"),
        ItemModel(id: UUID(), dueDate: Date().addingTimeInterval(3600), description: "Pay bills"),
        ItemModel(id: UUID(), dueDate: Date().addingTimeInterval(86400), description: "Go for a run")
    ]
}
