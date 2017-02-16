//
//  LessonCell.swift
//  MasterClub
//
//  Created by apple on 17/2/16.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class LessonCell: ASCellNode {
    
    let logo = ASImageNode()
    let titleLabel = UILabel()
    let purchaserCountLabel = UILabel()
    let priceLabel = UILabel()
    
    override init() {
        super.init()
        self.setupUI()
    }
    
    override func layout() {
     logo.frame =  CGRect(x: screenMargin , y: screenMargin, width: 20, height: 20)
    titleLabel.frame = CGRect(x:2 * screenMargin + 20, y: screenMargin, width: SCREENW - 20 - 3 * screenMargin, height: 20)
        purchaserCountLabel.frame = CGRect(x: 10, y: 40, width: 80, height: 10)
        priceLabel.frame = CGRect(x: SCREENW - 60, y: 40, width: 50, height: 12)
        
        
    }
    
    override func calculateSizeThatFits(_ constrainedSize: CGSize) -> CGSize {
   
//        //text的最小占用宽高
//        let CGsizeZero = CGSize(width: 0, height: 0)
//        //text的最大占用宽高
//        let CGsizeMax = CGSize(width: constrainedSize.width - 80, height: CGFloat.greatestFiniteMagnitude)
//        let asRange = ASSizeRange(min: CGsizeZero, max: CGsizeMax)
//        titleLabel.layoutThatFits(asRange)
//        
//        if titleLabel.calculatedSize.height < 50 {
//            return CGSize(width: constrainedSize.width, height: 70)
//        }else {
//            return CGSize(width: constrainedSize.width,
//                          height: 10 + titleLabel.calculatedSize.height + 10)
//        }    
        return CGSize(width: constrainedSize.width, height: 60)
    }
    
    func setupUI(){
//      logo = setImageNode(frame: CGRect(x: 5, y: 5, width: 10, height: 10))
        logo.image = UIImage(named: "test")
        addSubnode(logo)
        
        view.addSubview(titleLabel)
        titleLabel.text = "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"
        
        view.addSubview(purchaserCountLabel)
        purchaserCountLabel.text = "99人已购买"
        purchaserCountLabel.textColor = UIColor.lightGray
        purchaserCountLabel.font = UIFont.systemFont(ofSize: 13)
        
        
        view.addSubview(priceLabel)
        priceLabel.textColor = UIColor.red
        priceLabel.text = "￥9.9"
        purchaserCountLabel.font = UIFont.systemFont(ofSize: 15)


  
     
      
  


     
       
    }

}
