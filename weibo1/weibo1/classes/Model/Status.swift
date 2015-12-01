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
    var pic_urls: [[String : String]]?{
        didSet {
            guard  let urls = pic_urls else {
                print("数据加载失败")
                return
            }
            for oneURLDic in urls {
                let oneURLStr = oneURLDic["thumbnail_pic"]
                let url = NSURL(string: oneURLStr!)!
                imageURLs?.append(url)
            }
        }
    
    }
    var imageURLs: [NSURL]?
    
    init (dic : [String : AnyObject ]){
        super.init()
        setValuesForKeysWithDictionary(dic)
    }
    override func setValue(value: AnyObject?, forKey key: String) {

        if key == "user" {//当键为user时 , 这个键值的转换就不让它走系统的方法, 自己设置转换方法
           if let tem = value as? [String : AnyObject] { //MARK: 为什么一定要用 ? 不能用!
                
                user = User(dic: tem)
            }
            return
            
        }
        super.setValue(value, forKey: key)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
