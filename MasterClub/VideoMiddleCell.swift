//
//  VideoMiddleCell.swift
//  MasterClub
//
//  Created by apple on 17/2/17.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class VideoMiddleCell: UICollectionViewCell {
    
    var imageNode: ASImageNode?
    var titleLabel:UILabel?
    var subTitleLabel:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageNode = setImageNode(frame: CGRect(x: 0, y: 0, width: self.width , height: 90))
        imageNode?.image = UIImage(named: "test")
        
        addSubnode(imageNode!)
        //        addSubview(imageView!)
        
        titleLabel = UILabel(frame: CGRect(x: 0,y: 95,width: self.width ,height: 12))
        titleLabel?.textAlignment = .center
        titleLabel?.text = "名师授课 破解考点"
        addSubview(titleLabel!)
        
        subTitleLabel = UILabel(frame: CGRect(x: 0,y: 115,width: self.width ,height: 9))
        subTitleLabel?.textAlignment = .center
        subTitleLabel?.font = UIFont.systemFont(ofSize: 13)
        subTitleLabel?.textColor = UIColor.lightGray
        subTitleLabel?.text = "2333人看过"
        addSubview(subTitleLabel!)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
