//
//  ViewController.swift
//  MasterClub
//
//  Created by apple on 17/2/13.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit
//import AsyncDisplayKit


class HomeViewController: UIViewController {

    var ViewY:CGFloat?
    //文库类别View高度
    let libraryLogoViewHeight:CGFloat = 30
    let titleViewHeight:CGFloat = 80
    let bannerViewHeight:CGFloat = 180

    let nameGroup = ["语文思维学的逻辑","诗经浅解","详解《西游记》","在孤独的夜里曲折","小王子","论学英语的重要性"]
    let teacherGroup = ["赵老师","赵老师","赵老师","赵老师"]
    let teacherIconHW:CGFloat = 75
    let answerIconHW:CGFloat = 75
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        automaticallyAdjustsScrollViewInsets = false
        
        let banner = Banner(frame: CGRect(x: 0, y: 64, width: SCREENW, height: bannerViewHeight))
        BackScrollView.addSubview(banner)
        setuoMasterView()
        setupLibraryView()
        setupAnswerView()
        BackScrollView.contentSize = CGSize(width: SCREENW, height: ViewY! + 10 + 50)
        view.addSubview(BackScrollView)
        setupQuestionButton()
    
    }
    
    // MARK: 教师Section
    func setuoMasterView(){
        let View = UIView()
        View.backgroundColor = UIColor.white
        View.width = SCREENW
        //ButtonView的起始Y
        View.frame.origin.y = 64 + bannerViewHeight + screenMargin
        self.view.addSubview(View)
        let titleView = setTitleView(titleStr: "今日名师", subTitleStr: "灵魂的工程师")
        View.addSubview(titleView)
    
  

        
        for index in 0 ..< teacherGroup.count {
            let button = setupMasterButton(CGFloat(index), inGroup: teacherGroup)
            
            if index == teacherGroup.count - 1{
                View.height = button.frame.maxY + 10
            }
            View.addSubview(button)
            }
         ViewY = View.frame.maxY
        
      
        BackScrollView.addSubview(View)
        
    }
    
    func setupMasterButton(_ index:CGFloat,inGroup:[String]) -> UIView{
        
        let teacherViewWH = SCREENW / 2
        let teacherView = UIView(frame: CGRect(x: index.truncatingRemainder(dividingBy: 2) * teacherViewWH, y: titleViewHeight , width: teacherViewWH, height: teacherIconHW + 2 * screenMargin))
 
        
        let teacherND = setImageNode(frame: CGRect(x: screenMargin, y: 10, width: teacherIconHW, height: teacherIconHW))
        teacherND.image = UIImage(named: "test")
        teacherView.addSubnode(teacherND)
        
//        let teacherIcon = UIImageView(frame: CGRect(x: screenMargin, y: 10, width: teacherIconHW, height: teacherIconHW))
//        teacherIcon.image = UIImage(named: "test")
//        teacherView.addSubview(teacherIcon)
        
        let nameLabel = UILabel(frame: CGRect(x: screenMargin * 2 + teacherIconHW, y: 15, width: 50, height: 15))
        nameLabel.text = "张爱玲"
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        teacherView.addSubview(nameLabel)
        
        let levelLabel = UILabel(frame: CGRect(x: nameLabel.x, y: nameLabel.frame.maxY + 5, width: 50, height: 15))
        levelLabel.text = "特级教师"
        levelLabel.font = UIFont.systemFont(ofSize: 12)
        teacherView.addSubview(levelLabel)
        
        let schoolLabel = UILabel(frame: CGRect(x: nameLabel.x, y: levelLabel.frame.maxY + 5, width: 50, height: 15))
        schoolLabel.text = "海淀小学"
        schoolLabel.font = UIFont.systemFont(ofSize: 12)
        teacherView.addSubview(schoolLabel)
        
        if index > 1 {
            teacherView.y = teacherIconHW + 2 * screenMargin + 20 + titleViewHeight
        }
        return teacherView
    }

     // MARK: 文库Section

    func setupLibraryView(){
        let View = UIView()
        View.width = SCREENW
        //ButtonView的起始Y
        View.frame.origin.y = ViewY! + screenMargin
        self.view.addSubview(View)
        let titleView = setTitleView(titleStr: "今日文库", subTitleStr: "每天进步一点")
        View.addSubview(titleView)
        
        for index in 0 ..< nameGroup.count {
            let button = setupLibraryButton(CGFloat(index),buttonNumberInOneRow: 3,inGroup: nameGroup  )
            
            if index == nameGroup.count - 1{
                View.height = button.frame.maxY
            }
            View.addSubview(button)
        }
        ViewY = View.frame.maxY
        
        BackScrollView.addSubview(View)
    }
    
    func setupLibraryButton(_ index:CGFloat,buttonNumberInOneRow:CGFloat,inGroup:[String]) -> UIView{
        
        let buttonWH = SCREENW / buttonNumberInOneRow
        let libraryView = UIView(frame: CGRect(x: index.truncatingRemainder(dividingBy: buttonNumberInOneRow) * SCREENW/buttonNumberInOneRow, y: titleViewHeight, width: buttonWH, height: buttonWH + libraryLogoViewHeight))
        
        let button = circleButton(frame: CGRect(x: 0 , y: 0, width: buttonWH, height: buttonWH))
        let logoView = UIView(frame: CGRect(x: 0, y: buttonWH, width: SCREENW, height: libraryLogoViewHeight))
        let logo = UIImageView(frame: CGRect(x: button.center.x - 25, y: 5, width: 20, height: 20))
        logo.backgroundColor = UIColor.cyan
        let logoLabel = UILabel(frame: CGRect(x: button.center.x + 5 , y: 5, width: 50, height: 20))
        logoLabel.text = "特级教师"
        logoLabel.font = UIFont.systemFont(ofSize: 12)
        logoView.addSubview(logo)
        logoView.addSubview(logoLabel)
        libraryView.addSubview(button)
        libraryView.addSubview(logoView)
        libraryView.backgroundColor = UIColor.white
        
        button.setImage(UIImage(named:"test"), for: .normal)
        
        if index > buttonNumberInOneRow - 1 {
            
            libraryView.y = buttonWH + libraryLogoViewHeight + titleViewHeight
        }
        button.setTitle(nameGroup[Int(index)] , for: .normal)
        return libraryView
    }

    // MARK: 问答Section
    func setupAnswerView(){
    
        let View = UIView()
        View.width = SCREENW
        View.y = ViewY! + screenMargin
        View.backgroundColor = UIColor.white
   
        self.view.addSubview(View)
        let titleView = setTitleView(titleStr: "今日问答", subTitleStr: "解开你的疑惑")
        View.addSubview(titleView)
        
        for index in 0..<3{
        let answerView = setupAnswerButton(index: index)
        
            if index == 2 {
            View.height = answerView.frame.maxY + 10
             
            }
            View.addSubview(answerView)
        }
        ViewY = View.frame.maxY
        
        BackScrollView.addSubview(View)

    }
    
    func setupAnswerButton(index:Int) -> UIView{
        
        let View = UIView(frame: CGRect(x: screenMargin, y: titleViewHeight, width: SCREENW, height: 115))
        //问题信息区域
        let informationView = UIView(frame: CGRect(x: 0, y: 15, width: SCREENW - answerIconHW - 3 * screenMargin, height: answerIconHW + 20))
      
        let subjectLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 10))
        subjectLabel.text = "语文"
        subjectLabel.textColor = UIColor.lightGray
        subjectLabel.font = UIFont.systemFont(ofSize: 16)
        
        let dateLabel = UILabel(frame: CGRect(x: 60, y: 0, width: 50, height: 10))
        dateLabel.text = "10-19"
        dateLabel.textColor = UIColor.lightGray
        dateLabel.font = UIFont.systemFont(ofSize: 15)
        
        let answerConutLabel = UILabel(frame: CGRect(x: 120, y: 0, width: 80, height: 10))
        answerConutLabel.text = "18人回答"
        answerConutLabel.textColor = UIColor.yellow
        answerConutLabel.font = UIFont.systemFont(ofSize: 15)
        
        let detailLabel = UILabel(frame: CGRect(x: 0, y: 15, width: SCREENW - answerIconHW - 3 * screenMargin, height:
        answerIconHW - 20))
        detailLabel.text = "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊"
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont.systemFont(ofSize: 12)
        
        informationView.addSubview(subjectLabel)
        informationView.addSubview(dateLabel)
        informationView.addSubview(answerConutLabel)
        informationView.addSubview(detailLabel)
        //头像区域
        let answerIconNode = setImageNode(frame: CGRect(x: SCREENW - 2 * screenMargin - answerIconHW, y: 15, width: answerIconHW, height: answerIconHW))
        answerIconNode.image = UIImage(named: "test")
        
        if index == 1 {
            informationView.x = answerIconHW + screenMargin
            answerIconNode.view.x = 0
            View.y = titleViewHeight + answerIconHW + 30
        }
        if index == 2 {
            View.y = titleViewHeight + (answerIconHW + 30) * 2
        }
        
        View.addSubview(informationView)
        View.addSubnode(answerIconNode)
        return View
    }

    func setTitleView(titleStr:String,subTitleStr:String) -> UIView{

        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: titleViewHeight))
        titleView.backgroundColor = UIColor.white
        
        let title = UILabel(frame: CGRect(x: view.centerX - 60, y: 15, width: 120, height: 15))
        title.font = UIFont.systemFont(ofSize: 24)
        title.text = titleStr
        
        let arrowImage = UIImageView(image: UIImage(named: "test"))
        arrowImage.frame = CGRect(x: view.centerX + 50, y: 15, width: 15, height: 15)
        
        let subTitle = UILabel(frame: CGRect(x: view.centerX - 60, y: 45, width: 120, height: 10))
        subTitle.text = subTitleStr
        subTitle.textColor = UIColor.gray
        subTitle.font = UIFont.systemFont(ofSize: 14)
        
        titleView.addSubview(title)
        titleView.addSubview(subTitle)
        titleView.addSubview(arrowImage)

        return titleView
    }
    
    func setupQuestionButton(){
      
        let button = UIButton(frame: CGRect(x: SCREENW - 60, y: SCREENH - 109, width: 50, height: 50))
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.setImage(UIImage(named:"test"), for: .normal)
        view.addSubview(button)
        view.insertSubview(button, aboveSubview: BackScrollView)
        
    }

    fileprivate lazy var BackScrollView:UIScrollView = {
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH))
        scrollView.isScrollEnabled = true
        return scrollView
        
    }()
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

