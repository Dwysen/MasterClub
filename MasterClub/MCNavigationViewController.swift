//
//  MCNavigationViewController.swift
//  MasterClub
//
//  Created by apple on 17/2/13.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class MCNavigationViewController: UINavigationController {

    
    internal override class func initialize(){
        super.initialize()
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.lightGray
        navBar.tintColor = UIColor.white
        //  NSForegroundColorAttributeName:UIColor.whiteColor(),
        navBar.titleTextAttributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 20)]
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
