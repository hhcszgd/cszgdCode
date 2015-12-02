//
//  StatusOriginalView.swift
//  weibo1
//
//  Created by WY on 15/12/1.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
import SnapKit
class StatusOriginalView: UIView {
    var constrain : Constraint?
    var status : Status? {
        didSet {
     
            iconImageView.sd_setImageWithURL(status?.user?.headImageURL, placeholderImage: UIImage(named: "avatar_default_big"))
            avatar.image =  status?.user!.verified_type_image
            common_icon.image = status?.user!.mbrankImage
            nameLabel.text = status?.user?.name
            textLabel.text = status?.text
            pictureView.imageURLs = status?.imageURLs//给collectionView传递数据
//            creatTimeLabel.text = status?.created_at
//            source.text = status?.source
            if let tempURLs = status?.imageURLs where tempURLs.count != 0{
                pictureView.imageURLs = tempURLs
                self.snp_updateConstraints(closure: { (make) -> Void in
                    self.constrain = make.bottom.equalTo(pictureView.snp_bottom).offset(margin).constraint
                })
                pictureView.hidden = false
            }else{
                self.snp_makeConstraints(closure: { (make) -> Void in
                    self.constrain = make.bottom.equalTo(textLabel.snp_bottom).constraint
                })
            }
            
            
        }
    }
     override  init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0.8, alpha: 0.3)//UIColor(red: 100, green: 100, blue: 100, alpha: 1)
        layoutUI()
    }
    func layoutUI(){
        //添加头像,昵称等子控件
        self.addSubview(iconImageView)
        self.addSubview(avatar)
        self.addSubview(nameLabel)
        self.addSubview(common_icon)
        self.addSubview(textLabel)
        self.addSubview(creatTimeLabel)
        self.addSubview(source)
        self.addSubview(pictureView)
        
        iconImageView.snp_makeConstraints { (make) -> Void in
            make.left.top.equalTo(self/*.snp_left*/).offset(margin) // 这都能写错, 傻b
            make.width.height.equalTo(iconWidth)
        }
        avatar.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(iconImageView.snp_right)
            make.centerY.equalTo(iconImageView.snp_bottom)
        }
        nameLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(iconImageView.snp_right).offset(margin)
            make.top.equalTo(iconImageView.snp_top)
        }
        common_icon.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(nameLabel.snp_right).offset(margin)
            make.top.equalTo(nameLabel.snp_top).offset(margin)
        }
        creatTimeLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(iconImageView.snp_right).offset(margin)
            make.top.equalTo(nameLabel.snp_bottom)//.offset(margin/2)
        }
        source.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(creatTimeLabel.snp_right).offset(margin)
            make.top.equalTo(nameLabel.snp_bottom)//.offset(margin)
        }
        textLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(iconImageView.snp_left)//.offset(margin)
            make.top.equalTo(iconImageView.snp_bottom).offset(margin)

        }
        
//        这里添加图片视图
        pictureView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(textLabel.snp_bottom).offset(margin)
            make.left.equalTo(textLabel.snp_left)
//            make.size.equalTo(CGSize(width: 100, height: 100))
        }
       
        
        self.snp_makeConstraints { (make) -> Void in
          self.constrain =  make.bottom.equalTo(pictureView.snp_bottom).constraint
        }

    }
    
    
    
    lazy var  iconImageView : UIImageView = UIImageView()//用户头像
    lazy var avatar : UIImageView = UIImageView()//大V认证图
    lazy var common_icon : UIImageView = UIImageView(image: UIImage(named: "common_icon_membership"))//会员等级
    lazy var nameLabel : UILabel = UILabel(titleStr: "这个是占位字符, ", fontSize: 17.0, titleColor: UIColor.darkGrayColor())//用户昵称
    lazy var creatTimeLabel : UILabel = UILabel(titleStr: "time", fontSize: 12, titleColor: UIColor.orangeColor())
    lazy var source : UILabel = UILabel(titleStr: "source", fontSize: 12, titleColor: UIColor.grayColor())
    
    lazy var textLabel : UILabel = UILabel(titleStr: "微博正文占位符", fontSize: 16, titleColor: UIColor.grayColor(), margin: margin)
    private lazy var pictureView: PicView = PicView()
    
    
    
    
    
    
    
    
    
    
    
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
