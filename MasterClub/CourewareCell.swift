//
//  CourewareCell.swift
//  MasterClub
//
//  Created by apple on 17/2/16.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class CourewareCell: UICollectionViewCell {

    var imageNode: ASImageNode?
    var nameLabel:UILabel?
    var subjectLabel:UILabel?
    var teacherLabel:UILabel?
    var priceLabel:UILabel?
    var purchaserCountLabel:UILabel?
//    var likeBtn:UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        imageNode = setImageNode(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageNode?.image = UIImage(named: "test")
        
        addSubnode(imageNode!)
//        addSubview(imageView!)
        
        nameLabel = UILabel(frame: CGRect(x: 5,y: 160,width: self.width,height: 30))
        nameLabel?.numberOfLines = 2
        nameLabel?.text = "有趣的数学"
        addSubview(nameLabel!)
        
        subjectLabel = UILabel(frame: CGRect(x: 5,y: 190,width: self.width,height: 10))
        subjectLabel?.numberOfLines = 2
        subjectLabel?.font = UIFont.systemFont(ofSize: 13)
        subjectLabel?.textColor = UIColor.lightGray
        subjectLabel?.text = "高中化学"
        addSubview(subjectLabel!)
        
        teacherLabel = UILabel(frame: CGRect(x: 5,y: 205,width: self.width,height: 10))
        teacherLabel?.numberOfLines = 2
        teacherLabel?.font = UIFont.systemFont(ofSize: 13)
        teacherLabel?.textColor = UIColor.lightGray
        teacherLabel?.text = "北京十三中学熊婉清"
        addSubview(teacherLabel!)
        
        priceLabel = UILabel(frame: CGRect(x: 5,y: 215 ,width: self.width / 4,height: 30))
        priceLabel?.font = UIFont.systemFont(ofSize: 15)
        priceLabel?.textColor = UIColor.red
        priceLabel?.text = "￥9.9"
        addSubview(priceLabel!)
        
        purchaserCountLabel = UILabel(frame: CGRect(x: self.width / 4 + 20,y: 215 ,width: self.width / 4 * 3,height: 30))
        purchaserCountLabel?.font = UIFont.systemFont(ofSize: 13)
        purchaserCountLabel?.textColor = UIColor.lightGray
        purchaserCountLabel?.text = "99人已经购买"
        addSubview(purchaserCountLabel!)
        
//        likeBtn = UIButton(frame: CGRect(x: self.width - 50, y: priceLabel!.frame.origin.y,width: 50,height: 20))
//        likeBtn?.backgroundColor = UIColor.cyan
//        addSubview(likeBtn!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
