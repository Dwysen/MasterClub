//
//  LessonViewTableController.swift
//  MasterClub
//
//  Created by apple on 17/2/16.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class LessonPlanTableViewController: UIViewController {

    
    let mockData = [
        [NSURL(string: "http://tp1.sinaimg.cn/3985473000/180/5742244430/0")!, "杨大大117", "不论我们最后生疏到什么样子 要记住 曾经对你的好都是真的 ❤"],
        [NSURL(string: "http://tp3.sinaimg.cn/2466802634/180/5740492182/0")!, "孟矾矾", "温和而坚定。"],
        [NSURL(string: "http://tp2.sinaimg.cn/1736940353/180/5634177627/0")!, "郭德欣", "广州交通电台FM106.1主持人"],
        [NSURL(string: "http://tp4.sinaimg.cn/2379086631/180/40052837834/0")!, "我是你景儿", "店铺已更名为：JiLovèng 。大家可以在淘宝宝贝直接搜索这个，不分大小写。[心]jiloveng"]
    ]
    
    var tableNode:ASTableNode?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableNode = ASTableNode()
        tableNode?.frame = CGRect(x:0, y: 0 , width: SCREENW, height: SCREENH - 64 - kTitlesViewH - 49)
    
        
        tableNode?.delegate = self
        tableNode?.dataSource = self
        view.addSubnode(tableNode!)
//        
//        view.addSubview(asTableNode.view)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension LessonPlanTableViewController:ASTableDelegate,ASTableDataSource{
    
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let cellNode = LessonCell()
        
//        if indexPath.row < mockData.count {
//            let item = mockData[indexPath.row]
//            if let URL = item[0] as? NSURL,
//                let title = item[1] as? String,
//                let subTitle = item[2] as? String {
//                //                cellNode.configureData(iconURL: URL, title: title, subTitle: subTitle)
//            }
//        }
        
        return cellNode
    }

}
