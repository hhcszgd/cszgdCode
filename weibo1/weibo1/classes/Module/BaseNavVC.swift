//
//  BaseNavVC.swift
//  weibo1
//
//  Created by WY on 15/12/4.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

class BaseNavVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.hidesBottomBarWhenPushed = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count != 0 {//导航控制器的第一个控制器为主界面的tableViewVC , 如首页, 消息 等, 此时不能隐藏tabBar
                //点击转发的时候, 被push出来的控制器为第二个控制器, 此时才让它隐藏底部的tabBar
        
            viewController.hidesBottomBarWhenPushed = true
        }

        super.pushViewController(viewController, animated: animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
