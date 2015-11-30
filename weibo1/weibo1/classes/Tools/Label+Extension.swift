//
//  Label+Extension.swift
//  weibo1
//
//  Created by WY on 15/11/30.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
extension UILabel {
    convenience init (titleStr : String , fontSize : CGFloat , titleColor : UIColor ){
    
        self.init()
        
        text = titleStr
        font = UIFont.systemFontOfSize(fontSize )
        numberOfLines = 0
//        frame = CGRectMake (100 , 444 , 200,29)
        textAlignment = NSTextAlignment.Center
        textColor = titleColor
        sizeToFit()
    
    }

}
