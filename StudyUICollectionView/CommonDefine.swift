//
//  CommonDefine.swift
//  StudyUICollectionView
//
//  Created by ls on 2018/5/21.
//  Copyright © 2018年 ls. All rights reserved.
//

import Foundation
import UIKit

struct ScreenUtil {
    
    static let kScreenWidth  = UIScreen.main.bounds.size.width
    static let kScreenHeight  = UIScreen.main.bounds.size.height
    
    //设计标准
    static let designWidth: CGFloat = 375
    static let desingHeight: CGFloat = 667
    
    //缩放比例
    static let widthRatio: CGFloat = ScreenUtil.kScreenWidth / ScreenUtil.designWidth
    static let heightRatio: CGFloat = ScreenUtil.kScreenHeight / ScreenUtil.desingHeight
    
    static func getRelativeWidth(_ designSize: CGFloat) -> CGFloat! {
        return designSize * ScreenUtil.widthRatio
    }
    
    static func getRelativeHeight(_ designSize: CGFloat) -> CGFloat! {
        return designSize * ScreenUtil.heightRatio
    }
}
