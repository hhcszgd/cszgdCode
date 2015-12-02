//
//  Status.swift
//  weibo1
//
//  Created by WY on 15/11/30.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

class Status: NSObject {
    //转发的微博
    var retweeted_status : Status?//这个属性的类型跟Status模型的层次结构是一模一样的
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
//            print("在微博moxing中打印图片链接数组的个数\(pic_urls!.count)")////////////打印有值
            imageURLs = [NSURL]()//实例化属性
            for oneURLDic in urls {
                let oneURLStr = oneURLDic["thumbnail_pic"]
                let url = NSURL(string: oneURLStr!)!
//                 print("在微博moxing中打印图片链接数组的个数\(url)")//在这儿也有值
                imageURLs?.append(url)//这一步计算有问题
//                 print("在微博moxing中打印图片链接数组的个数\(imageURLs?.count)")
            }
//            print("在微博moxing中打印图片链接数组的个数\(imageURLs?.count)")////////////打印全空

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
