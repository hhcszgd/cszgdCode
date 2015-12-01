//
//  User.swift
//  weibo1
//
//  Created by WY on 15/11/30.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

class User: NSObject {
//用户uid
    var id = 0
    //用户名字
    var name : String?

    //认证等级
    var  verified_level : NSNumber?
    //用户头像地址
    var profile_image_url: String?
    //定义用户头像的计算型属性
    var headImageURL: NSURL? {
        return NSURL(string: profile_image_url ?? "")
    }
    
    /// 认证类型，-1：没有认证，0，认证用户，2,3,5: 企业认证，220: 达人
    var verified_type: Int = -1
    //认真类型图片
    var verified_type_image: UIImage? {
        switch verified_type {
        case -1 : return nil
        case 0 : return UIImage(named: "avatar_vip")
        case 2,3,5: return UIImage(named: "avatar_enterprise_vip")
        case 220: return UIImage(named: "avatar_grassroot")
        default : return nil
        }
    }
    /// 会员等级 0-6
    var mbrank: Int = 0
    //用户等级图片
    var mbrankImage: UIImage? {
        if mbrank > 0 && mbrank < 7 {
            return UIImage(named: "common_icon_membership_level\(mbrank)")
        }
        return nil
    }
    init(dic : [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dic)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }//    avatar_large
//    name
//    created_at
//    verified_level
}
