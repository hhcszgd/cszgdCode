//
//  UIView+TargateResponder.swift
//  weibo1
//
//  Created by WY on 15/12/4.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

extension  UIView {

    func targateResponderVC() -> (UINavigationController)? {
    var next = self.nextResponder()
        repeat{
            if let temp = next as? UINavigationController {
                return temp
            }
            next = next?.nextResponder()
            
        }while( next != nil )
        return nil
    }
    
}
