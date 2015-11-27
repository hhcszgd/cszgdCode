//
//  BarViewController.swift
//  weibo1
//
//  Created by WY on 15/11/26.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
import AFNetworking
//:MARK window的根控制器
class BarViewController: UITabBarController {

    override func viewDidLoad() {//在试图加载完毕的viewDidLoad,把系统的tabBar换成自定义的,因为系统的tabBar时只读的, 不好设置frame
        super.viewDidLoad()
        let customTabBar = CustomTabBar()
        setValue(customTabBar, forKeyPath: "tabBar")//利用KVC替换tabBar
        customTabBar.addBtn.addTarget(self, action: "addBtnClick", forControlEvents: .TouchUpInside)//给tabBar上的黄色加号按钮添加监听方法
        addVC()//调用自定义的给tabBarVC添加子控制器的方法

        // Do any additional setup after loading the view.
    }
    @objc private func addBtnClick (){
        print("点击加号按钮")
    }
    //:MARK 自定义添加自控制器方法
    func addVC (){
        
        let homeTableVC = HomeTableViewController()
        let messageTableVC = MessageTableViewController()
        let discoverTableVC = DiscoverTableViewController()
        let profileTableVC = ProfileTableViewController()
        addVCMethod("首页", VC: homeTableVC, imgName: "tabbar_home")
        addVCMethod("消息", VC: messageTableVC, imgName: "tabbar_message_center")
        addVCMethod("发现", VC: discoverTableVC, imgName: "tabbar_discover")
        addVCMethod("我的", VC: profileTableVC, imgName: "tabbar_profile")

    }
    //:MARK 抽取一个每一个控制器对应的按钮的图片和文字
    func addVCMethod(title : String , VC : UIViewController ,imgName : String ){
    
        let navVC = UINavigationController(rootViewController: VC)
        VC.title = title
        VC.tabBarItem.image = UIImage(named: imgName)
        self.tabBar.tintColor = themeColor
        self.addChildViewController(navVC)
    
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
