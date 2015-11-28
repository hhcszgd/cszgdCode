//
//  Account.swift
//  weibo1
//
//  Created by WY on 15/11/28.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

class Account: NSObject , NSCoding {
    var access_token : String?//存储token
    var uid : String?//用户ID
    var remind_in : NSTimeInterval = 0 //提醒时间
    var expires_in: NSTimeInterval = 0 {
        didSet {
            expires_date = NSDate(timeIntervalSinceNow: expires_in)
        }
    }
    
    //计算型属性 计算token失效的日期
    //开发者账号的有效期 是5年
    //普通用户的有效期 是 3天  未审核通过的token的有效期 是1天
    var expires_date: NSDate?
    //友好显示名称
    var name: String?
    //用户头像地址（大图），180×180像素
    var avatar_large: String?
    init (dict : [String : AnyObject]){
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override var description : String {
        let arr = ["access_token","uid","expires_in","remind_in","expires_date"]
        return dictionaryWithValuesForKeys(arr).description
    
    }

    
    
    
    
    
    
    
    
    
    
 
    //保存自定义对象
    func saveAccount() {//归档
        //保存到沙盒路径   stringbyappendingpathcomment          //在Xcode 7.0  消失了
        let path = (NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last! as NSString).stringByAppendingPathComponent("account.plist")
        NSKeyedArchiver.archiveRootObject(self, toFile: path)
        
        print(path)
    }
    
    //从磁盘中 获取自定义对象
    //class func  标示 类方法  和 OC  + 方法 一样
    class func loadAccount() -> Account? {//解档
        let path = (NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last! as NSString).stringByAppendingPathComponent("account.plist")
        //解归档
        if let account = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? Account {
            
            //添加过期日期判断
            if account.expires_date?.compare(NSDate()) == NSComparisonResult.OrderedDescending {
                return account
            }
        }
        return nil
    }
    
    //过滤
    override func setValue(value: AnyObject?, forUndefinedKey key: String) { }
    

    
    //实现NSCoding 协议方法
    //解归档 将二进制数据 -> 对象 反序列化相似
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        expires_date = aDecoder.decodeObjectForKey("expires_date") as? NSDate
        uid = aDecoder.decodeObjectForKey("uid") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        avatar_large = aDecoder.decodeObjectForKey("avatar_large") as? String
    }
    //归档  将对象 -> 二级制数据 存储砸沙盒路径  存在磁盘上 序列化相似
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeObject(expires_date, forKey: "expires_date")
        aCoder.encodeObject(uid, forKey: "uid")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(avatar_large, forKey: "avatar_large")
    }
}
