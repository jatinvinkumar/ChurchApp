//
//  PostTableViewCell.swift
//  SlideUp
//
//  Created by Jatin K on 11/20/17.
//  Copyright © 2017 Jatin K. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet var appImage: UIImageView!
    @IBOutlet var postedDate: UIButton!
    override func awakeFromNib() {
        
        appImage.layer.cornerRadius = (appImage.frame.size.width/2)
        postedDate.layer.cornerRadius = 8;
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
