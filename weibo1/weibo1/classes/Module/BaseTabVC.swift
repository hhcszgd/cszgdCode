//
//  BaseTabVC.swift
//  weibo1
//
//  Created by WY on 15/11/26.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
// :MARK 四个tableViewVC所继承的基类, 并在这个基类中做一些初始化操作,
class BaseTabVC: UITableViewController , VisitorViewDelegate {//遵守登录注册按钮协议

    var isLogin = false//定义一个布尔变量 , 用来标记用户是否已经登录 , 如果登录, 就提供数据并显示, 如果没有登录 , 就提供一套访客视图 , 并提示用户登录或者注册
    let visitorView = VisitorView() // 定义一个全局的访客视图view ,
    //重写父类的viewDidLoad方法,并设置导航栏左右两侧的登录 和注册按钮
    override func viewDidLoad() {
        if isLogin {//如果登录 , 就提供数据并显示
        super.viewDidLoad()
        }else{//如果没有登录, 就提供一套访客视图
            visitorView.backgroundColor = UIColor.greenColor()//设置访客视图的背景颜色(每必要)
            self.view=visitorView//把tableView替换成自定义的访客visitorView
            visitorView.visitorViewDelegate = self//设置登录注册按钮代理
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: "loginButtonClick") //设置访客视图下 ,导航栏左右两侧的登录和注册按钮
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: "registerButtonClick")
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    //实现登录注册按钮协议方法
    func loginBtnDidClick (){
    print("loginBtnDidClick")
        loginButtonClick()
    }
    func registerDidBtnClick(){
        print("registerDidBtnClick")
    }
    //:MARK 点击登录按钮的监听方法  , 弹出控制器
    func loginButtonClick (){
        print("loginButtonClick")
        let loginViewController = LoginVC()//创建点击登录按钮后要跳转的控制器
        let nav = UINavigationController(rootViewController : loginViewController)//创建一个导航控制器, 包着上一个控制器
        presentViewController(nav, animated: true, completion: nil)//弹出控制器
    }
    //:MARK 点击注册按钮的监听方法
    func registerButtonClick (){
        print("registerButtonClick")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
