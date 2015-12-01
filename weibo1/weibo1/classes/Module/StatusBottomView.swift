//
//  StatusBottomView.swift
//  weibo1
//
//  Created by WY on 15/12/1.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
let screenWidth = UIScreen.mainScreen().bounds.width
class StatusBottomView: UIView {

    override init(frame: CGRect) {
        super.init(frame:frame)
//        backgroundColor = UIColor.greenColor()
        setUpUI()
    }
    func setUpUI(){
//        let btnW = screenWidth/3
        self.addSubview(leftBtn)
        self.addSubview(midBtn)
        self.addSubview(rightBtn)
        
        leftBtn.snp_makeConstraints { (make) -> Void in
            make.top.left.bottom.equalTo(self)
        }
        midBtn.snp_makeConstraints { (make) -> Void in
            make.top.bottom.equalTo(self)
            make.left.equalTo(leftBtn.snp_right)
            make.width.equalTo(leftBtn.snp_width)
        }
        rightBtn.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(midBtn.snp_right)
            make.top.right.bottom.equalTo(self)
            make.width.equalTo(midBtn.snp_width)
        }
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
    lazy var leftBtn : UIButton = UIButton(title: "转发", imgName: "timeline_icon_retweet" , fontSize: 13)
    lazy var midBtn : UIButton = UIButton(title: "评论", imgName: "timeline_icon_comment",fontSize: 13)
    lazy var rightBtn : UIButton = UIButton(title: "赞", imgName: "timeline_icon_unlike" ,fontSize: 13)

    
}
