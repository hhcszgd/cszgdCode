//
//  StatusListViewModel.swift
//  weibo1
//
//  Created by WY on 15/12/2.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
import AFNetworking
import SDWebImage
import SVProgressHUD

class StatusListViewModel: NSObject {
    //MARK: 加载数据
    class func loadData(finished: (statuses: [Status]?) -> () ) {
        let urlString = "2/statuses/home_timeline.json"
        
        guard let token = UserAccountViewModel().token else {
            SVProgressHUD.showErrorWithStatus("您暂未登录")
            return
        }
        let parameters = ["access_token": token]
        NetworkTool.shareTool.loadHttpData(.GET, urlStr: urlString, parameters: parameters) { (result, error) -> () in
            if error != nil {
                print("数据类型有误")
                //错误的回调一定要执行
                finished(statuses: nil)
                return
            }
            
            guard let array = result!["statuses"] as? [[String : AnyObject]] else {
                finished(statuses: nil)
                return
            }
            //遍历数据
            //实例化容器数组
            var list = [Status]()
            for item in array {
                //字典转模型
                let s = Status(dic: item)
                list.append(s)
            }
            //执行回调
            //            finished(statuses: list)
//            cacheStatusSingleImage(list, finished: finished)
        }
    }}