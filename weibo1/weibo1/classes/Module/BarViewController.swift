//
//  BarViewController.swift
//  weibo1
//
//  Created by WY on 15/11/26.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
import AFNetworking
class BarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let customTabBar = CustomTabBar()
        setValue(customTabBar, forKeyPath: "tabBar")
        customTabBar.addBtn.addTarget(self, action: "addBtnClick", forControlEvents: .TouchUpInside)
        addVC()

        // Do any additional setup after loading the view.
    }
    @objc private func addBtnClick (){
        print("点击加号按钮")
    }
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
