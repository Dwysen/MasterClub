//
//  VideoVieController.swift
//  MasterClub
//
//  Created by apple on 17/2/17.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class VideoVieController: UIViewController {

    let bannerViewHeight:CGFloat = 150
    let titleViewHeight:CGFloat = 40
    let middleCollectionViewHeight:CGFloat = 266
    let bottomCollectionViewHeight:CGFloat = 155
    var ViewY:CGFloat?
    var MiddleCollectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let banner = Banner(frame: CGRect(x: 0, y:0, width: SCREENW, height: bannerViewHeight))
        BackScrollView.addSubview(banner)
    
        setupTodayUpdateSection()
        
        setupRecommendedList()
        
        BackScrollView.contentSize = CGSize(width: SCREENW, height: ViewY! + 10)
        view.addSubview(BackScrollView)

    }

    func setupTodayUpdateSection(){
        
        let View = UIView()
       
        let titleView = setupTitleView(title: "今日更新")
        View.addSubview(titleView)
        
        View.frame = CGRect(x: 0, y: bannerViewHeight + screenMargin, width: SCREENW, height: titleViewHeight + middleCollectionViewHeight)
    
        BackScrollView.addSubview(View)
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: titleViewHeight, width: SCREENW, height: 266), collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.register(VideoMiddleCell.self, forCellWithReuseIdentifier: "VideoMiddleCell")
        MiddleCollectionView = collectionView
        View.addSubview(collectionView)
        ViewY = View.frame.maxY

    }
    func setupRecommendedList(){
        
        let View = UIView()
        
        let titleView = setupTitleView(title: "推荐榜单")
        View.addSubview(titleView)
   
        View.frame = CGRect(x: 0, y: ViewY! + screenMargin, width: SCREENW, height: titleViewHeight + bottomCollectionViewHeight)
    
   
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: titleViewHeight, width: SCREENW, height: bottomCollectionViewHeight), collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
  
        View.addSubview(collectionView)
        
        BackScrollView.addSubview(View)
        ViewY = View.frame.maxY
    
    
    }
    func setupTitleView(title:String) -> UIView{
        let View = UIView()
        let titleLabel = UILabel(frame: CGRect(x: 12, y: 12, width: 100,height: 15))
        titleLabel.text = title
        titleLabel.textColor = UIColor.green
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        View.addSubview(titleLabel)
        
        let moreBtn = UIButton(frame: CGRect(x: SCREENW - 60, y: 15, width: 48, height: 10))
        moreBtn.setTitle("更多>", for: UIControlState())
        moreBtn.setTitleColor(UIColor.green, for: UIControlState())
        moreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        moreBtn.titleLabel?.textAlignment = .right
        moreBtn.addTarget(target, action: #selector(moreBtnClick), for: .touchUpInside)
        View.frame = CGRect(x: 0, y: 0, width: SCREENW, height: titleViewHeight)
        View.addSubview(moreBtn)
        return View
    
    }
    func moreBtnClick(){
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    fileprivate lazy var BackScrollView:UIScrollView = {
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH - 64 - kTitlesViewH - 49))
        scrollView.isScrollEnabled = true
        return scrollView
        
    }()
}

extension VideoVieController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == MiddleCollectionView {
         return 4
        } else {
        return 10
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView ==  MiddleCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if collectionView == MiddleCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoMiddleCell", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 125, height: 125))
            imageView.image = UIImage(named: "test")
                cell.addSubview(imageView)
            return cell
        }

    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == MiddleCollectionView {
            return CGSize(width: (UIScreen.main.bounds.width - 6) / 2, height: 133) }
        return CGSize(width: 125, height: 125)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == MiddleCollectionView {
         return 0
        } else {
        return 5
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

