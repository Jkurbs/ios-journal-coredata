//
//  EntryController.swift
//  Journal
//
//  Created by Kerby Jean on 2/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//


import CoreData
import Foundation

enum Mood: String, CaseIterable {
    case sad = "🙁"
    case neutral = "😐"
    case happy = "🙂"
}

class EntryController {
    
    // Create
    func create(identifier: String, title : String, bodyText: String?, mood: String, timestamp: Date) {
        let _ = Entry(identifier: identifier, title: title, bodyText: bodyText, mood: mood, timestamp: timestamp)
        saveToPersistentStore()
    }
    
    // Update
    func update(entry: Entry, title : String, bodyText: String?, mood: String, timeStamp: Date) {
        entry.bodyText = bodyText
        entry.title = title
        entry.mood = mood
        entry.timestamp = timeStamp
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
