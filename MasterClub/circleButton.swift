//
//  circleButton.swift
// DuoTang
//
//  Created by Dwysen on 16/9/22.
//  Copyright © 2016年 Dwysen. All rights reserved.
//

import UIKit

class circleButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame.origin.x = 10
        imageView?.width = self.width - 20
        imageView?.height = (imageView?.width)!
//        imageView?.layer.cornerRadius = (self.width - 20) / 2
//        imageView?.layer.masksToBounds = true
        
        
        titleLabel?.frame.origin.x = 0
        titleLabel?.frame.origin.y = imageView!.height
        titleLabel?.width = self.width
        titleLabel?.height = self.height - self.titleLabel!.frame.origin.y
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 12)
        titleLabel?.textColor = UIColor.black
    }
}
