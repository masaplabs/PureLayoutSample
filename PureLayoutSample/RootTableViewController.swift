//
//  RootTableViewController.swift
//  PureLayoutSample
//
//  Created by 川村真史 on 2014/11/07.
//  Copyright (c) 2014年 Masafumi Kawamura. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    let tableViewCellIdentifier = "cell"
    
    // MARK: - Init
    
    override convenience init() {
        self.init(nibName: nil, bundle: nil)
        self.title = "Root Table View"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Configure the cell...
        
        var cell: CustomTableViewCell? = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier) as? CustomTableViewCell

        if ((cell) == nil) {
            cell = CustomTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: tableViewCellIdentifier)
        }
        
        var text: String = ""
        
        for (var i = 0; i < Int(indexPath.row); i++) {
            text = text + "This is Sample Text. Programmatically Swift Sample."
        }
        
        cell!.title.text = "Cell No.\(indexPath.row)"
        cell!.body.text = text
        cell!.picture.image = UIImage(named: "ico_group")
        
        cell!.setNeedsUpdateConstraints()
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let controller: DetailViewController = DetailViewController(title: "Detail View")
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}