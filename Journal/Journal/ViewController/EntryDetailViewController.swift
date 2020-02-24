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
        
        if let entryController = entryController, let title = titleField.text {
            if let entry = entry {
                let body = bodyTextView.text
                let date = Date()
                entryController.update(entrie: entry, title: title, bodyText: body, timeStamp: date)
            } else {
                let body = bodyTextView.text
                let id = randomId()
                let date = Date()
                entryController.create(identifier: id, title: title, bodyText: body, timestamp: date)
            }
            navigationController?.popViewController(animated: true)
        }
    }
    
    func updateViews() {
        titleField.text = entry?.title
        bodyTextView.text = entry?.bodyText
    }
    
    func randomId() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<6).map{ _ in letters.randomElement()! })
    }
}

