//
//  PostsViewController.swift
//  SlideUp
//
//  Created by Jatin K on 11/20/17.
//  Copyright © 2017 Jatin K. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
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
extension UserViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "appCell")
        cell?.backgroundColor = UIColor.clear
        cell?.layer.cornerRadius = 8
        return cell!
    }
    
    // MARK: - UITableViewDelegate
}

extension UserViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
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
        
        return 0
    }
    
    
    
}
extension CGRect{
    init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat) {
        self.init(x:x,y:y,width:width,height:height)
    }
    
}
extension CGSize{
    init(_ width:CGFloat,_ height:CGFloat) {
        self.init(width:width,height:height)
    }
}
extension CGPoint{
    init(_ x:CGFloat,_ y:CGFloat) {
        self.init(x:x,y:y)
    }
}


