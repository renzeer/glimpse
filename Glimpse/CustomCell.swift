//
//  CustomCell.swift
//  Glimpse
//
//  Created by Renzee Reyes on 12/6/14.
//  Copyright (c) 2014 Renzee Reyes. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    // Outlets for cell elements
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLikes: UILabel!
    @IBOutlet weak var cellComments: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
