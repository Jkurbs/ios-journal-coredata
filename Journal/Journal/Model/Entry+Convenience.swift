//
//  Entry+Convenience.swift
//  Journal
//
//  Created by Kerby Jean on 2/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//


import CoreData
import Foundation

extension Entry {
    convenience init(identifier: String, title: String, bodyText: String? = nil, mood: String, timestamp: Date, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.identifier = identifier
        self.title = title
        self.bodyText = bodyText
        self.mood = mood
        self.timestamp = timestamp
    }
}
