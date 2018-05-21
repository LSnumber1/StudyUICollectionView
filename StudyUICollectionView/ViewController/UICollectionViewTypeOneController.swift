//
//  UICollectionViewTypeOneController.swift
//  StudyUICollectionView
//
//  Created by ls on 2018/5/21.
//  Copyright © 2018年 ls. All rights reserved.
//

import UIKit
import SnapKit

class UICollectionViewTypeOneController: UIViewController {
    var collectionView: UICollectionView!
    //图片源
    var dataCollection = [#imageLiteral(resourceName: "test1"),#imageLiteral(resourceName: "test1"),#imageLiteral(resourceName: "test1"),#imageLiteral(resourceName: "test1"),#imageLiteral(resourceName: "test1")]
    //自动滚动计时器
    var autoScrollTimer:Timer?
    // collectionView 下标
    var index: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        initCollectionView()
        startTimer()
    }
}
//MARK: - 逻辑
extension UICollectionViewTypeOneController {
    //设置自动滚动计时器
    func startTimer() {
        //设置一个定时器，每三秒钟滚动一次
        autoScrollTimer = Timer.scheduledTimer(timeInterval: 3, target: self,
                                               selector: #selector(UICollectionViewTypeOneController.scroll),
                                               userInfo: nil, repeats: true)
    }
    
    //计时器时间一到，滚动一张图片
    @objc func scroll(){
        index = index + 1
        index = index >= dataCollection.count ? 0 : index
        collectionView.scrollToItem(at: IndexPath.init(row: index, section: 0), at: .centeredHorizontally, animated: true)
    }
}
//MARK: - UI
extension UICollectionViewTypeOneController {
    func initCollectionView() {
        let flowLayout = ProductAHorCollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.clipsToBounds = false
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: "ProductACollectionViewCell", bundle:nil), forCellWithReuseIdentifier: ProductACollectionViewCell.forCellReuseIdentifier)
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(ScreenUtil.getRelativeWidth(200))
            make.top.equalTo(ScreenUtil.getRelativeWidth(29))
        }
        
    }
}

//MARK: - UICollectionViewDelegate
extension UICollectionViewTypeOneController: UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ProductACollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductACollectionViewCell.forCellReuseIdentifier, for: indexPath) as! ProductACollectionViewCell
      
        return cell
    }
    //手动拖拽滚动开始
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //使自动滚动计时器失效（防止用户手动移动图片的时候这边也在自动滚动）
        autoScrollTimer?.invalidate()
    }
    //手动拖拽滚动结束
    func scrollViewDidEndDragging(_ scrollView: UIScrollView,
                                  willDecelerate decelerate: Bool) {
        //重新启动自动滚动计时器
        startTimer()
    }
}
//MARK: - UICollectionViewDelegate
extension UICollectionViewTypeOneController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCollection.count
    }
}
