//
//  DataPersistance.swift
//  todolist
//
//  Created by Luis Esteban Haro on 26/04/23.
//

import Foundation

class DataPersistence {

    private let fileManager = FileManager.default
    private let documentsDirectory: URL
    private let itemsURL: URL
    
    init() {
//         Creating an instance of the FileManager class, which provides access to the file system. Using the instance's urls(for:in:) method to get the URL for the app's document directory. Document Directory is what is persisted to ICloud

        self.documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        self.itemsURL = documentsDirectory.appendingPathComponent("items").appendingPathExtension("json")
    }

    
    func saveItems(_ items: [ItemModel]) throws {
        let encoder = JSONEncoder()
        let encodedItems = try encoder.encode(items)
        try encodedItems.write(to: itemsURL)
    }
    
    func loadItems() throws -> [ItemModel] {
        guard fileManager.fileExists(atPath: itemsURL.path) else {
            return []
        }
        
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: itemsURL)
        let decodedItems = try decoder.decode([ItemModel].self, from: data)
        return decodedItems
    }
    
    func appendItem(_ item: ItemModel) throws {
        let encoder = JSONEncoder()
        let existingData: Data
        if fileManager.fileExists(atPath: itemsURL.path) {
            existingData = try Data(contentsOf: itemsURL)
        } else {
            existingData = Data()
        }
        let encodedItem = try encoder.encode(item)
        let combinedData = existingData + encodedItem
        try combinedData.write(to: itemsURL)
    }

    func deleteNoteByTitle(_ id: UUID) throws {
        var items = try loadItems()
        items.removeAll { $0.id == id }
        try saveItems(items)
    }
}
