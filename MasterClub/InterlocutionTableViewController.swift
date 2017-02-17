//
//  InterlocutionViewController.swift
//  MasterClub
//
//  Created by apple on 17/2/17.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class InterlocutionTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 10
        } else {
            return 1
        }
      
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
        return 180
        }
        return 44
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = UITableViewCell(frame: CGRect(x: 0, y: 0, width: SCREENW, height: 180))
            let bannerView = Banner(frame: CGRect(x: 0, y: 0, width: SCREENW, height: 180))
            cell.addSubview(bannerView)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Hello"
            return cell
        }
    }
}


//extension InterlocutionViewController:UITableViewDelegate,UITableViewDataSource{
//
//
//}
