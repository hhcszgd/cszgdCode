//
//  Status.swift
//  weibo1
//
//  Created by WY on 15/11/30.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

class Status: NSObject {
    ///微博创建时间
    var created_at: String?
    //微博ID
    var id: Int = 0
    //微博正文
    var text: String?
    //微博来源
    var source: String?
    //添加user属性
    var user: User?
    //配图数组属性
    var pic_urls: [[String : String]]?
    var imageURLs: [NSURL]?
    
    override init (){
    
    
    }
}
