//
//  TableViewCell.swift
//  assignment
//
//  Created by Kushal Jogi on 8/31/15.
//  Copyright (c) 2015 Kushal Jogi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var alphaLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
