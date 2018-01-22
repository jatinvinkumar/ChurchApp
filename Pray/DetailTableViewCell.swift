//
//  DetailTableViewCell.swift
//  PrayerApp
//
//  Created by Jatin K on 9/10/17.
//  Copyright © 2017 Jatin K. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet var subCat: UILabel!
    
    @IBOutlet var date: UILabel!
    @IBOutlet var number: UILabel!
    var showingBack = false
    
    @IBOutlet var submittedBy: UILabel!
    
    @IBOutlet var frontView: UIView!
    @IBOutlet var titleLabel: UILabel!

    @IBOutlet var requestLabel: UILabel!
    @IBOutlet var backView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(flip))
        singleTap.numberOfTapsRequired = 1
        contentView.addGestureRecognizer(singleTap)
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func flip() {
        
        print("Badum")
        let toView = showingBack ? frontView : backView
        let fromView = showingBack ? backView : frontView
        UIView.transition(from: fromView!, to: toView!, duration: 1, options: .transitionFlipFromTop, completion: nil)
            toView?.translatesAutoresizingMaskIntoConstraints = true
            //toView.spanSuperview()
            showingBack = !showingBack
            
        
    }


}
