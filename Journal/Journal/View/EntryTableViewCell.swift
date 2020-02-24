//
//  EntryTableViewCell.swift
//  Journal
//
//  Created by Kerby Jean on 2/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    static var id: String {
        return String(describing: self)
    }
    
    var entry: Entry? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        guard let entry = entry else {return}
        titleLabel.text = entry.title
        descriptionLabel.text = entry.bodyText
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let dateString = dateFormatter.string(from: entry.timestamp!)
        dateLabel.text = dateString
    }
}
