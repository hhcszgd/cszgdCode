//
//  StatusPicView.swift
//  weibo1
//
//  Created by WY on 15/12/1.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

class StatusPicView: UICollectionView {
    var imgURLs : [NSURL]? {
        didSet{//类似于oc的重写set方法
            //可以先来个测试显示数据
            //接受到数据,根据数据计算collectionView的大小, 
            //重新更新约束,
            //刷新数据
            
        }
    }
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let flowLayout = UICollectionViewFlowLayout()//设置布局属性
        
        
        
        
        super.init(frame: frame, collectionViewLayout: flowLayout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
