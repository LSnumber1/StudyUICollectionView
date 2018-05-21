//
//  ProductAHorCollectionViewFlowLayout.swift
//  FillColor
//
//  Created by ls on 2018/4/27.
//  Copyright © 2018年 huyunlong. All rights reserved.
//

import UIKit

class ProductAHorCollectionViewFlowLayout: UICollectionViewFlowLayout {
    //元素宽度
    var itemWidth: CGFloat!
    //元素高度
    var itemHeight: CGFloat!
    //对一些布局的准备操作放在这里
    override func prepare() {
        super.prepare()
        
        itemWidth = ScreenUtil.getRelativeWidth(301)
        itemHeight = itemWidth * 200 / 301
        //设置元素大小
        self.itemSize = CGSize(width: itemWidth, height: itemHeight)
        //设置滚动方向
        self.scrollDirection = .horizontal
        //设置间距
        self.minimumInteritemSpacing = ScreenUtil.getRelativeWidth(15)
        //设置内边距
        //左右边距为了让第一张图片与最后一张图片出现在最中央
        //上下边距为了让图片横行排列，且只有一行
        let left = (self.collectionView!.bounds.width - itemWidth) / 2
        let top = (self.collectionView!.bounds.height - itemHeight) / 2
        self.sectionInset = UIEdgeInsetsMake(top, left, top, left)
        
    }
    /**
     proposedContentOffset: 停止的位置
     velocity: 滚动速度
     */
    override func targetContentOffset(forProposedContentOffset
        proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        //停止滚动时的可见区域
        let lastRect = CGRect(x: proposedContentOffset.x, y: proposedContentOffset.y,
                              width: self.collectionView!.bounds.width,
                              height: self.collectionView!.bounds.height)
        //当前屏幕中点，相对于collect view上的x坐标
        let centerX = proposedContentOffset.x + self.collectionView!.bounds.width * 0.5;
        //这个可见区域内所有的单元格属性
        let array = self.layoutAttributesForElements(in: lastRect)
        
        //需要移动的距离
        var adjustOffsetX = CGFloat(MAXFLOAT);
        for attri in array! {
            //每个单元格里中点的偏移量
            let deviation = attri.center.x - centerX
            //保存偏移最小的那个
            if abs(deviation) < abs(adjustOffsetX) {
                adjustOffsetX = deviation
            }
        }
        //通过偏移量返回最终停留的位置
        return CGPoint(x: proposedContentOffset.x + adjustOffsetX, y: proposedContentOffset.y)
    }
}
