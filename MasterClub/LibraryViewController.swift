//
//  FriendViewController.swift
//  MasterClub
//
//  Created by apple on 17/2/16.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class LibraryViewController: UIViewController {
    
  
    /// 顶部标题的y
    let kTitlesViewY: CGFloat = 64
    /// 线宽
    let klineWidth: CGFloat = 1.0
    /// 首页顶部标签指示条的高度
    let kIndicatorViewH: CGFloat = 2.0
    
    let titleArr = ["教案","课件","习题","视频","书刊","随笔"]
    let colorArr = [UIColor.white,UIColor.brown,UIColor.cyan,UIColor.yellow,UIColor.brown,UIColor.cyan]
    
    var titlesView = UIView()
    var indicatorView = UIView()
    var selectedBtn = UIButton()
    var contentView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let vc1 = LessonPlanTableViewController()
        
        self.addChildViewController(vc1)
        
        let vc2 = CoursewareViewController()
        
        self.addChildViewController(vc2)
        
        let vc3 = VideoVieController()
        
        self.addChildViewController(vc3)
        
//        let vc4 = InterlocutionTableViewController()
//        
//         self.addChildViewController(vc4)
        
        
        
//        for i in 0 ..< titleArr.count {
//            
//            let vc = LessonPlanTableViewController()
//            
//            vc.view.backgroundColor = colorArr[i]
//            
//            self.addChildViewController(vc)
//            
//        }
        
//        let vc = LessonPlanTableViewController()
        
        self.setupTitleView()
        
        self.setupContentView()
        
    }
    
    func setupTitleView(){
        let bgView = UIView()
        bgView.frame = CGRect(x: 0, y: kTitlesViewY, width: SCREENW, height: kTitlesViewH)
        view.addSubview(bgView)
        
        //标签
        let titlesView = UIView()
        titlesView.backgroundColor = DTGlobalColor()
        titlesView.frame = CGRect(x: 0, y: 0, width: SCREENW, height: kTitlesViewH)
        bgView.addSubview(titlesView)
        
        //底部红色指示器
        let indicatorView = UIView()
        indicatorView.backgroundColor = DTGlobalRedColor()
        indicatorView.height = kIndicatorViewH
        indicatorView.frame.origin.y = kTitlesViewH - kIndicatorViewH
        self.indicatorView = indicatorView
        
        //内部子标签
        
        let count = childViewControllers.count
        let width = titlesView.width / CGFloat(count)
        let height = titlesView.height
        
        for index in 0..<count{
            let btn = UIButton()
            btn.height = height
            btn.width = width
            btn.frame.origin.x = CGFloat(index) * width
            btn.tag = index
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.setTitle(titleArr[index], for: UIControlState())
            btn.setTitleColor(UIColor.gray, for: UIControlState())
            btn.setTitleColor(DTGlobalRedColor(), for: .disabled)
            btn.addTarget(self, action: #selector(titlesClick(_:)), for: .touchUpInside)
            titlesView.addSubview(btn)
            
            //默认点击第一个按钮
            if index == 0 {
                
                btn.isEnabled = false
                selectedBtn = btn
                //让按钮内部的Label根据文字来计算内容, 否则得不到titleLabel的width
                btn.titleLabel?.sizeToFit()
                
                indicatorView.width = btn.titleLabel!.width
                indicatorView.center.x = btn.center.x
            }
        }
        titlesView.addSubview(indicatorView)
        self.titlesView = titlesView
        
    }
    
    func setupContentView(){
        
        automaticallyAdjustsScrollViewInsets = false
        let contentView = UIScrollView()
        contentView.frame = view.bounds
        contentView.y = kTitlesViewY + kTitlesViewH
        contentView.delegate = self
        contentView.contentSize = CGSize(width: contentView.width * CGFloat(childViewControllers.count), height: contentView.height)
        
        view.insertSubview(contentView, at: 0)
        contentView.isPagingEnabled = true
        self.contentView = contentView
        scrollViewDidEndScrollingAnimation(contentView)
        
    }
    
    func titlesClick(_ btn:UIButton) {
        selectedBtn.isEnabled = true
        btn.isEnabled = false
        selectedBtn = btn
        
        UIView.animate(withDuration: 0.25, animations: {
            self.indicatorView.width = self.selectedBtn.titleLabel!.width
            self.indicatorView.center.x = self.selectedBtn.center.x
        })
        
        contentView.setContentOffset(CGPoint(x: CGFloat(btn.tag) * contentView.width, y: 0), animated: true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension LibraryViewController:UIScrollViewDelegate {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        
        let vc = childViewControllers[index]
        
        vc.view.frame.origin.x = scrollView.contentOffset.x
        //设置控制器的Y为0，默认为20
        vc.view.frame.origin.y = 0
        
        scrollView.addSubview(vc.view)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        // 当前索引
        
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 点击 Button
        let button = titlesView.subviews[index] as! UIButton
        titlesClick(button)
    }
    
}
