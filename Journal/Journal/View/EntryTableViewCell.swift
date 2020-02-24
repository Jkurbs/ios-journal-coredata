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
    
    
}
