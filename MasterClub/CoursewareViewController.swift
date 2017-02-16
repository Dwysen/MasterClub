//
//  coursewareViewController.swift
//  MasterClub
//
//  Created by apple on 17/2/16.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class CoursewareViewController: UIViewController {

    weak var collectionView: UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCollectionView(){
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH - 64 - kTitlesViewH - 49), collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CourewareCell.self, forCellWithReuseIdentifier: "CourewareCell")
        self.collectionView = collectionView
        view.addSubview(collectionView)
        
    }
    
}

extension CoursewareViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourewareCell", for: indexPath)
        return cell        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 20) / 2, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
}
