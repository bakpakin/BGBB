//
//  ExpandingTableViewCell.swift
//  BGBB_Options
//
//  Created by Nathan Canterbury on 3/25/17.
//  Copyright © 2017 Nathan Canterbury. All rights reserved.
//

import UIKit

class ExpandingTableViewCellContent {
    var title: String?
    var subtitle: String?
    var expanded: Bool
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        self.expanded = false
    }
}

class ExpandingTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
         
    }
    
    func set(_ content: ExpandingTableViewCellContent) {
        self.titleLabel.text = content.title
        self.subtitleLabel.text = content.expanded ? content.subtitle : ""
    }
}
