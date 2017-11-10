//
//  CustomTableViewCell.swift
//  TableViewExpandible
//
//  Created by Jorge MR on 09/08/17.
//  Copyright © 2017 Jorge MR. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var shortLabel: UILabel!
    
    @IBOutlet weak var longLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
