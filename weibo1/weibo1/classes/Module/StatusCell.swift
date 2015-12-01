//
//  StatusCell.swift
//  weibo1
//
//  Created by WY on 15/12/1.
//  Copyright © 2015年 WY. All rights reserved.
//
/**
自定义cell的思路
cell里面分两大部分
1 , 原始微博部分,    (原始微博部分又分为 一下几个部分
    1 , 用户头像
    2 , 用户认证等级
    3 , 用户昵称
    4 , 用户会员等级
    5 , 微博正文
    6 , 图片部分的UIView (根据数据模型里的图片url个数 计算出图片所占位置  以及图片的布局方式)
        6.1 自定义一个collectionView, 放在图片位置的UIView中, 把图片显示到相应的collectionViewCell中)
2 , 底部评论,转发等视图部分
*/
import UIKit
  let margin : CGFloat = 10.0
    let iconWidth : CGFloat = 35.0
class StatusCell: UITableViewCell {
  
    private lazy var statusOriginalView : StatusOriginalView = StatusOriginalView()
    private lazy var statusBottomView : StatusBottomView = StatusBottomView()
    var status: Status? {
        didSet {
                        statusOriginalView.status = status
        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    func setUpUI(){
        contentView.addSubview(statusOriginalView)
        contentView.addSubview(statusBottomView)
        statusOriginalView.snp_makeConstraints { (make) -> Void in
            make.top.left.equalTo(contentView)
            //            make.height.width.equalTo(50)//看看效果.先

        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
///////////////////////以下都是没用的东西//////////////////////////////
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
