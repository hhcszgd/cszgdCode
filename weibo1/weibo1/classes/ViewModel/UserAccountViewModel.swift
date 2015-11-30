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
    var account: Account? // 这个account的数据来自沙盒存储的数据  , 跟下面的临时account没关系, 因为作用域问题 也不会导致冲突
    
    override init() {//这个方法的作用是 一方面可以实例化对象, 另一方面可以实例化一个可以从沙盒里取数据的account数据,
        //可以用在appdelegate里面实例化并 判断属性userLogin 的值来判断用户是否已经登录
        super.init()
        account = Account.loadAccount()
        print("在VM类中 用户模型是否有值\(account)")
    }
    
    //用户是否登录
    var userLogin: Bool {
        return account?.access_token != nil//如果token有值,说明用户是出于登录状态
    }
    
    var token: String? {
        return account?.access_token //token的值来自登录账户模型 , 而账户模型数据是来自初始化方法中, 到沙盒去取得数据
    }
    
    
    var headImageURL: NSURL? {
        let url = NSURL(string: account?.avatar_large ?? "")
        return url
    }
    
    //用户名的计算性属性
    
    var userName: String? {
        return account?.name
    }
    
    
    
    
    
    
    
    
    
    //提供一个对象方法
    func loadToken (code : String , finishCallBack : (error : NSError?) ->()) {
        let urlString = "https://api.weibo.com/oauth2/access_token"//微博官网提供的请求url
        let param = ["client_id": client_id, "client_secret" : client_secret,"grant_type":"authorization_code","code":code, "redirect_uri":redirect_uri]
        let netManager = AFHTTPSessionManager()
        print("ddddddddddddddddddddddddddddddddddddddddd2")

        netManager.responseSerializer.acceptableContentTypes?.insert("text/plain")
        netManager.POST(urlString, parameters: param, success: { (_, result) -> Void in
            //加载成功处理
            guard let dic = result as? [String : AnyObject] else {
                print("ddddddddddddddddddddddddddddddddddddddddd1")
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
            let account = Account(dict: dic)  //这个account是第一次存储用户token用到的 , 跟属性account没关系
            //利用account的token属性去获取用户信息, (此处抽取一个方法)
//            self.loadUserInfo(account, finishCallBack: { (error) -> () in///////////////////////////
//                finishCallBack(error: error)
//            })
            print("ddddddddddddddddddddddddddddddddddddddddd3")

            self.loadUserInfo(account, finishCallBack: finishCallBack)
//            self.loadUserInfo(account, finishCallBack: { (error) -> () in
//                ////////////////////////////////
//            })
            print("ddddddddddddddddddddddddddddddddddddddddd4")

            print("字典转模型\(account)")
            }) { (_, error) -> Void in
                //加载失败处理
                print("错误信息\(error)")
                finishCallBack(error: error)
                }
    }
    func loadUserInfo (account : Account , finishCallBack : (error :NSError?)->()){ //这个方法中的account是上一个方法传递过来的临时account,跟属性account无关
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
//            print("获取用户信息\(result )")
            account.avatar_large = result["avatar_large"] as? String
            account.name = result["name"] as? String
            account.saveAccount()
            //在这儿归档
            print("测试一下归档的时候account有数据没\(account)")
            finishCallBack(error: nil)//   草泥马,闭包的作用???????,为什么这儿调 , 下面还要调
            
            }) { (_, error) -> Void in
                //失败处理
                finishCallBack(error: error)//这句什么P用????????在请求失败的情况下把失败信息通过闭包传递到调用方,提示调用失败
                print(error)

        }//fuck我似乎明白了点,netManager.GET(urlString, parameters: param, success: 这个方法有两个闭包, 并且只能会执行一个, 如果请求成功, 就走请求成功的闭包, 如果失败就走请求失败的闭包, 如果请求成功, 回调调用地方的闭包就不需要传递错误信息, 如果请求失败才需要传递错误信息error
        
    }
}
