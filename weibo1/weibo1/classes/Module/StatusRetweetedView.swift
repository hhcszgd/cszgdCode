//
//  StatusRetweetedView.swift
//  weibo1
//
//  Created by WY on 15/12/3.
//  Copyright © 2015年 WY. All rights reserved.
//
/**

*/
import UIKit
import SnapKit
class StatusRetweetedView: UIView {
    var bottomConstrains : Constraint?
    //懒加载属性控件
    lazy var retweetLabel = UILabel(titleStr: "这是我转发的微博", fontSize: 15, titleColor: UIColor.grayColor(), margin: 15)
    lazy var retweetImgView : PicView = PicView()
    var statuses1 :Status? {
        didSet{
            
            retweetLabel.text = "@: " + (statuses1?.user?.name ?? "") + "\t\t\t\t" + (statuses1?.text ?? "")
            retweetImgView.imageURLs = statuses1?.imageURLs//statuses?.imageURLs//////////////////////////////
            
                }
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    func setUpUI(){
        self.addSubview(retweetLabel)
        self.addSubview(retweetImgView)
        retweetLabel.snp_makeConstraints { (make) -> Void in
//            make.top.left.equalTo(self).offset(margin)
            make.top.equalTo(self.snp_top)
            make.left.equalTo(self.snp_left)
            
        }
        retweetImgView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self)
            make.top.equalTo(retweetLabel.snp_bottom)
        }
        self.snp_makeConstraints { (make) -> Void in
          self.bottomConstrains =  make.bottom.equalTo(retweetImgView.snp_bottom).constraint
        }
    
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
