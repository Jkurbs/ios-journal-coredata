//
//  Entries.swift
//  Journal
//
//  Created by Kerby Jean on 2/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Journal")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("message: \(error)")
            }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
