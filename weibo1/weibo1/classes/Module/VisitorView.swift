//
//  VisitorView.swift
//  weibo1
//
//  Created by WY on 15/11/26.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    func setVisitorViewInfo(title : String , imgName : String){
        
         self.imgView.image =  UIImage(named: imgName)
       
//        imgView.frame = CGRectMake(100, 100, 200, 200)
        self.addSubview(imgView)
        tipLable.text = title
        self.addSubview(tipLable)
        self.addSubview(loginBtn)
    }
    

    lazy var imgView : UIImageView = {
        let im = UIImageView( image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    im.frame = CGRectMake(100,200 ,200,200)
    return im
    
    }()
    lazy var tipLable :UILabel = {
    
      
        let label = UILabel()
        label.text = "这里是首页, 赶紧登陆吧"
        label.font = UIFont.systemFontOfSize(19.0)
        label.numberOfLines = 0
        label.frame = CGRectMake (100 , 444 , 200,29)
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.redColor()
        label.sizeToFit()
        return label
    }()
    lazy var loginBtn : UIButton = {
        let b = UIButton()
//        b.setBackgroundImage ( UIImage(named: "common_button_white_disable"))
        b.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        b.setTitle("登陆", forState: .Normal)
        b.backgroundColor = UIColor.purpleColor()
        b.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        b.setTitleColor(UIColor.blueColor(), forState: .Normal)
        b.titleLabel?.font = UIFont.systemFontOfSize(16.0)
        b.sizeToFit()
        b.frame = CGRectMake(200,500,100,40)
        return b
    }()
    
    lazy var registerBtn : UIButton = {
        let b = UIButton()
        //        b.setBackgroundImage ( UIImage(named: "common_button_white_disable"))
        b.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        b.setTitle("登陆", forState: .Normal)
        b.backgroundColor = UIColor.purpleColor()
        b.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        b.setTitleColor(UIColor.blueColor(), forState: .Normal)
        b.titleLabel?.font = UIFont.systemFontOfSize(16.0)
        b.sizeToFit()
        b.frame = CGRectMake(200,500,100,40)
        return b
    }()


}
