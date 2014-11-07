//
//  ViewController.swift
//  PureLayoutSample
//
//  Created by 川村真史 on 2014/11/07.
//  Copyright (c) 2014年 Masafumi Kawamura. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Init
    
    override convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    // with argument
    convenience init(title: String?) {
        self.init()
        
        if (title != "") {
            self.title = title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

