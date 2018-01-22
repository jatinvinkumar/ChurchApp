//
//  AccountTableViewCell.swift
//  SlideUp
//
//  Created by Jatin K on 11/22/17.
//  Copyright © 2017 Jatin K. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet var profilePic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profilePic.layer.cornerRadius = profilePic.frame.size.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
