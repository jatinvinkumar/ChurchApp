//
//  PostsViewController.swift
//  SlideUp
//
//  Created by Jatin K on 11/20/17.
//  Copyright © 2017 Jatin K. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    override func
        viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - UITableViewDataSource
extension AccountViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "appCell")
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell")
            return cell!
        }
        cell?.backgroundColor = UIColor.clear
        cell?.layer.cornerRadius = 8
        return cell!
    }
    
    // MARK: - UITableViewDelegate
}

extension AccountViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 260
        }
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?  {
        
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: "Header") as! CustomHeaderTableViewCell
        //headerCell.backgroundColor = UIColor.cyan
    
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 41.0
    }
    
    
    
}

