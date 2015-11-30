//
//  VisitorView.swift
//  weibo1
//
//  Created by WY on 15/11/26.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
protocol VisitorViewDelegate : NSObjectProtocol {//定义登录注册按钮协议 ,
    func loginBtnDidClick ()//定义登录注册按钮协议方法
    func registerDidBtnClick()
}
class VisitorView: UIView { // 自定义访客模式下显示的View
    weak var visitorViewDelegate : VisitorViewDelegate?//定义登录注册按钮协议属性

    override init(frame: CGRect) {
        super.init(frame: frame)
        loginBtn.addTarget(self, action: "loginBtnClick", forControlEvents: .TouchUpInside)
        registerBtn.addTarget(self, action: "registerBtnClick", forControlEvents: .TouchUpInside)
    }
    
    func loginBtnClick(){//在这儿调用登录注册按钮协议方法
        self.visitorViewDelegate?.loginBtnDidClick()
    }
    func registerBtnClick(){//在这儿调用登录注册按钮协议方法
        self.visitorViewDelegate?.registerDidBtnClick()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setVisitorViewInfo(title : String , imgName : String){//提供一个设置图片和lable的接口
        
         self.imgView.image =  UIImage(named: imgName)
       
//        imgView.frame = CGRectMake(100, 100, 200, 200)
        self.addSubview(imgView)
        tipLable.text = title
        self.addSubview(tipLable)
        self.addSubview(loginBtn)
        self.addSubview(registerBtn)
   }
    

    lazy var imgView : UIImageView = {
        let im = UIImageView( image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    im.frame = CGRectMake(100,200 ,200,200)
    return im
    
    }()
    lazy var tipLable :UILabel = //UILabel(titleStr: "这里是首页, 赶紧登陆吧", fontSize: 19.0 , titleColor: UIColor.redColor())
    {
    
      
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
        b.frame = CGRectMake(80,500,100,40)
        return b
    }()
    
    lazy var registerBtn : UIButton = UIButton(title: "注册", backImgName: "common_button_white_disable", backColor: UIColor.orangeColor(), titleColor: UIColor.blueColor(), titleFontSize: 16.0)
//    {
//        
//        
//        let b = UIButton()
//        //        b.setBackgroundImage ( UIImage(named: "common_button_white_disable"))
//        b.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
//        b.setTitle("注册", forState: .Normal)
//        b.backgroundColor = UIColor.purpleColor()
//        b.setTitleColor(UIColor.orangeColor(), forState: .Normal)
//        b.setTitleColor(UIColor.blueColor(), forState: .Normal)
//        b.titleLabel?.font = UIFont.systemFontOfSize(16.0)
//        b.sizeToFit()
//        b.frame = CGRectMake(200,500,100,40)
//        return b
//    }()


}
