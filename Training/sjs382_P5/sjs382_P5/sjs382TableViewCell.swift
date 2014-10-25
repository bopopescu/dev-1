//
//  sjs382TableViewCell.swift
//  sjs382_P5
//
//  Created by Samuel Svenningsen on 10/24/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit

class sjs382TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
