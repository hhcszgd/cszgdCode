//
//  Button+Extension.swift
//  weibo1
//
//  Created by WY on 15/11/30.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
extension UIButton {

    convenience init ( title : String ,backImgName : String ,backColor : UIColor , titleColor : UIColor , titleFontSize : CGFloat  ){
    self.init()
        
        
        //        b.setBackgroundImage ( UIImage(named: "common_button_white_disable"))
        self.setBackgroundImage(UIImage(named: backImgName), forState: .Normal)
        self.setTitle(title, forState: .Normal)
        self.backgroundColor = backColor
        self.setTitleColor(titleColor, forState: .Normal)
        self.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.titleLabel?.font = UIFont.systemFontOfSize(titleFontSize)
        self.sizeToFit()
        self.frame = CGRectMake(200,500,100,40)
    
    }
    convenience init (title : String , imgName : String , fontSize : CGFloat){
        self.init()
        setImage(UIImage(named:imgName), forState: UIControlState.Normal)
        setTitle(title, forState: .Normal)
        setTitleColor(UIColor.greenColor(), forState: .Normal)
        titleLabel?.font = UIFont.systemFontOfSize(fontSize)
    }

}