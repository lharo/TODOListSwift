//
//  DataPersistance.swift
//  todolist
//
//  Created by Luis Esteban Haro on 27/04/23.
//

import Foundation

class DataPersistence {
    
    private let fileManager = FileManager.default
    private let documentsDirectory: URL
    private let itemsURL: URL
    
    init(){
        self.documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        self.itemsURL = documentsDirectory.appendingPathComponent("items").appendingPathExtension("json")
    }
    
    func saveItems(items: [ItemModel]) throws {
        let encoder = JSONEncoder()
        let encodedItems = try encoder.encode(items)
        try encodedItems.write(to: itemsURL)
    }
    
    func loadItems() -> throws [ItemModel] {
        guard fileManager.fileExists(atPath: itemsURL.path) else {
            return []
        }
        
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: itemsURL)
        let decodedItems = try decoder.decode([ItemModel].self, from: data)
        return decodedItems
    }
    
}
