//
//  NetworkTool.swift
//  weibo1
//
//  Created by WY on 15/12/2.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
import AFNetworking
let nameDomain = "https://api.weibo.com/"
//枚举的定义, 1 ,关键字 enum 2 , 枚举类型名 3 , 枚举值类型 Int OR  String 4 , 枚举值修饰词 5 , 枚举值
enum HTTPMethod :String{
  case   GET =  "GET"
   case  POST =  "POST"
}


class NetworkTool: AFHTTPSessionManager {
    static let shareTool:NetworkTool = {
        let url = NSURL(string: nameDomain)
        let temp = NetworkTool(baseURL: url)
        temp.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return temp
    }()
    func loadHttpData(httpMethod : HTTPMethod , urlStr : String , parameters : [String : AnyObject] , finished : (result : [String : AnyObject]? , error:NSError? ) -> () ){
        if httpMethod == HTTPMethod.GET {
            GET(urlStr, parameters: parameters, success: { (_, result) -> Void in
                if let dic = result as? [String : AnyObject] {
                    finished(result: dic, error: nil)
                    return
                }
                finished(result: nil, error: NSError(domain: "com.baidu.www", code: -18181881, userInfo: [NSLocalizedDescriptionKey : "数据格式错误"]))
                }, failure: { (_ , error) -> Void in
                    finished(result: nil, error: error)
            })
        }else {
            POST(urlStr, parameters: parameters, success: { (_, result) -> Void in
                if let dic = result as? [String : AnyObject] {
                    finished(result: dic, error: nil)
                    return
                }
                finished(result: nil, error: NSError(domain: "com.baidu.www", code: -18181881, userInfo: [NSLocalizedDescriptionKey : "数据格式错误"]))
                }, failure: { (_ , error ) -> Void in
                     finished(result: nil, error: error)
            })
        }
    
    }
    
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
            //如果转换成功, 就再这里(利用模型类的自定义初始化方法, 初始化方法可以用kvc设置属性值)创建一个数据模型,
            let account = Account(dict: dic)  //这个account是第一次存储用户token用到的 , 跟属性account没关系
//            self.loadUserInfo(account, finishCallBack: finishCallBack)

            }) { (_, error) -> Void in
                //加载失败处理
                print("错误信息\(error)")
                finishCallBack(error: error)
        }
    }

}
