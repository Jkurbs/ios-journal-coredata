//
//  ViewController.swift
//  Journal
//
//  Created by Kerby Jean on 2/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var segmentedCtrl: UISegmentedControl!
    
    // MARK: - Properties
    
    var entry: Entry?
    var entryController: EntryController?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = entry {
            updateViews()
        }
    }
    
    
    // MARK: - Actions
    
    @IBAction func saveEntry(_ sender: Any) {
        
        let body = bodyTextView.text
        let id = randomId()
        let date = Date()
        let moodIndex = segmentedCtrl.selectedSegmentIndex
        let mood = Mood.allCases[moodIndex]
        
        if let entryController = entryController, let title = titleField.text {
            if let entry = entry {
                entryController.update(entry: entry, title: title, bodyText: body, mood: mood.rawValue, timeStamp: date)
            } else {
                entryController.create(identifier: id, title: title, bodyText: body, mood: mood.rawValue, timestamp: date)
            }
            navigationController?.popViewController(animated: true)
        }
    }
    
    func updateViews() {
        
        guard let entry = entry else { return }
        titleField.text = entry.title
        bodyTextView.text = entry.bodyText
        
        var mood: Mood
        if let entrymood = entry.mood {
            mood = Mood(rawValue: entrymood)!
        } else {
            mood = .neutral
        }
        segmentedCtrl.selectedSegmentIndex = Mood.allCases.firstIndex(of: mood) ?? 1
    }
    
    func randomId() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<6).map{ _ in letters.randomElement()! })
    }
}

