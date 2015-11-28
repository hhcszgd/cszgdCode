//
//  UserAccountViewModel.swift
//  weibo1
//
//  Created by WY on 15/11/28.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
import AFNetworking

class UserAccountViewModel: NSObject {
    
    
    //qie
    var account: Account?
    
    override init() {
        super.init()
        account = Account.loadAccount()
    }
    
    //用户是否登录
    var userLogin: Bool {
        return account?.access_token != nil
    }
    
    var token: String? {
        return account?.access_token
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //提供一个对象方法
    func loadToken (code : String , finishCallBack : (error : NSError?) ->()) {
        let urlString = "https://api.weibo.com/oauth2/access_token"//微博官网提供的请求url
        let param = ["client_id": client_id, "client_secret" : client_secret,"grant_type":"authorization_code","code":code, "redirect_uri":redirect_uri]
        let netManager = AFHTTPSessionManager()
        netManager.responseSerializer.acceptableContentTypes?.insert("text/plain")
        netManager.POST(urlString, parameters: param, success: { (_, result) -> Void in
            //加载成功处理
            guard let dic = result as? [String : AnyObject] else {
                return
            }
            print("打印测试1\(result)")
            print("打印测试2\(dic)")

            /**
            打印测试1{
            "access_token" = "2.00ml8IrF0JhWVdf0c1b97a85rQAtzB";
            "expires_in" = 98144;
            "remind_in" = 98144;
            uid = 5365823342;
            }
            打印测试2["access_token": 2.00ml8IrF0JhWVdf0c1b97a85rQAtzB, "remind_in": 98015, "uid": 5365823342, "expires_in": 98015]
            */
            //如果转换成功, 就再这里(利用模型类的自定义初始化方法, 初始化方法可以用kvc设置属性值)创建一个数据模型,
            let account = Account(dict: dic)
            //利用account的token属性去获取用户信息, (此处抽取一个方法)
//            self.loadUserInfo(account, finishCallBack: { (error) -> () in///////////////////////////
//                finishCallBack(error: error)
//            })
            self.loadUserInfo(account, finishCallBack: finishCallBack)
            print("字典转模型\(account)")
            }) { (_, error) -> Void in
                //加载失败处理
                print("错误信息\(error)")
                finishCallBack(error: error)
                }
    }
    func loadUserInfo (account : Account , finishCallBack : (error :NSError)->()){
        //对应文档链接http://open.weibo.com/wiki/2/users/show
        let urlString = "https://api.weibo.com/2/users/show.json"
        //为了保险起见 判断一下
        guard let access_token = account.access_token,userId = account.uid else {
            //            SVProgressHUD.showErrorWithStatus("获取网络数据失败,请稍后再试")
            return
        }
        let param   = ["access_token": access_token, "uid": userId]
        let netManager = AFHTTPSessionManager()
        netManager.GET(urlString, parameters: param, success: { (_, result ) -> Void in
            //成功处理
            print("获取用户信息\(result )")
            account.avatar_large = result["avatar_large"] as? String
            account.name = result["name"] as? String
            account.saveAccount()
            //在这儿归档
            }) { (_, error) -> Void in
                //失败处理
                finishCallBack(error: error)
                print(error)

        }
        
    }
}
