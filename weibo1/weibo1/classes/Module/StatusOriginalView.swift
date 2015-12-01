//
//  StatusOriginalView.swift
//  weibo1
//
//  Created by WY on 15/12/1.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

class StatusOriginalView: UIView {

    var status : Status? {
        didSet {
     
            iconImageView.sd_setImageWithURL(status?.user?.headImageURL, placeholderImage: UIImage(named: "avatar_default_big"))
            avatar.image =  status?.user!.verified_type_image
            common_icon.image = status?.user!.mbrankImage
            nameLabel.text = status?.user?.name
            textLabel.text = status?.text
        }
    }
     override  init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = UIColor.blueColor()
        layoutUI()
    }
    func layoutUI(){
        //添加头像,昵称等子控件
        self.addSubview(iconImageView)
        self.addSubview(avatar)
        self.addSubview(nameLabel)
        self.addSubview(common_icon)
        
        iconImageView.snp_makeConstraints { (make) -> Void in
            make.left.top.equalTo(self.snp_left).offset(margin)
            make.width.height.equalTo(iconWidth)
        }
        avatar.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(iconImageView.snp_right)
            make.centerY.equalTo(iconImageView.snp_bottom)
        }
        nameLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(iconImageView.snp_right).offset(margin)
            make.top.equalTo(self.snp_top).offset(margin)
        }
        common_icon.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(nameLabel.snp_right).offset(margin)
            make.top.equalTo(self.snp_top).offset(margin)
        }
        textLabel.snp_makeConstraints { (make) -> Void in
//            make.left.equalTo(self.snp_left).offset(margin)
//            make.top.equalTo(iconImageView.snp_bottom).offset(margin)
//            make.bottom.equalTo(self.snp_bottom).offset(margin)
        }
        self.snp_makeConstraints { (make) -> Void in
//            make.bottom.equalTo(textLabel.snp_bottom)
        }

    }
    
    
    
    lazy var  iconImageView : UIImageView = UIImageView()//用户头像
    lazy var avatar : UIImageView = UIImageView()//大V认证图
    lazy var common_icon : UIImageView = UIImageView(image: UIImage(named: "common_icon_membership"))//会员等级
    lazy var nameLabel : UILabel = UILabel(titleStr: "这个是占位字符, ", fontSize: 17.0, titleColor: UIColor.darkGrayColor())//用户昵称
    
    lazy var textLabel : UILabel = UILabel(titleStr: "微博正文占位符", fontSize: 16, titleColor: UIColor.grayColor(), margin: margin)
    private lazy var pictureView: StatusPicView = StatusPicView()
    lazy var bottomView :StatusBottomView  = StatusBottomView()
    
    
    
    
    
    
    
    
    
    
    
    
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
