//
//  EntryController.swift
//  Journal
//
//  Created by Kerby Jean on 2/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//


import CoreData
import Foundation

class EntryController {
    
    var entries: [Entry] {
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        do {
            return try CoreDataStack.shared.mainContext.fetch(fetchRequest)
        } catch {
            NSLog("Error fetching tasks: \(error)")
            return []
        }
    }
    
    // Create
    func create(identifier: String, title : String, bodyText: String?, timestamp: Date) {
        let _ = Entry(identifier: identifier, title: title, bodyText: bodyText, timestamp: timestamp)
        saveToPersistentStore()
    }
    
    // Update
    func update(entrie: Entry, title : String, bodyText: String?, timeStamp: Date) {
        entrie.bodyText = bodyText
        entrie.title = title
        entrie.timestamp = timeStamp
        saveToPersistentStore()
    }
    
    // Delete
    func delete(entrie: Entry) {
        CoreDataStack.shared.mainContext.delete(entrie)
        saveToPersistentStore()
    }
    
    
    
    // Save to persistence
    func saveToPersistentStore() {
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch {
            print(error)
        }
    }
}
