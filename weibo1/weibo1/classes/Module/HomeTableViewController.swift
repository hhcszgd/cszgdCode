//
//  HomeTableViewController.swift
//  weibo1
//
//  Created by WY on 15/11/26.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
import AFNetworking
class HomeTableViewController: BaseTabVC {

    override func viewDidLoad() {
/////////////////////////////////////在给tableViewCell注册之前必须判断 用户是否处于登录状态, 如果是处于登录状态, 才去注册,并实现相应的代理方法和数据源方法  可以通过父类的属性isLogin 来判断当前用户是否是处于登录状态
        
        super.viewDidLoad()
        if !isLogin {
            print ("请登录,好不好")
            visitorView.setVisitorViewInfo("关注一些人，回这里看看有什么惊喜,关注一些人", imgName: "visitordiscover_feed_image_house")
            return
        }
        prepearForTableViewInfo()//布局tableView相关属性
        loadDataSource()//加载数据源
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

    }
    func loadDataSource (){
        //官方URL 
        let urlStr = "https://api.weibo.com/2/statuses/home_timeline.json"
        //设置加载数据所需的token数据并加载微博数据
        guard let token = UserAccountViewModel().token else {
            print("数据加载失败, 请重试")
            return
        }
        let param = ["access_token" : token]
        let sessionManage = AFHTTPSessionManager()
        sessionManage.GET(urlStr, parameters: param, success: { (_, result ) -> Void in
            //成功处理
//            let dic = result as! [String : AnyObject]//全部数据信息(包含所有微博)字典
//            let statuses = dic["statuses"]!//全部微博数据 数组
//            let statuses = result["statuses"] as! [[String : AnyObject]]
            guard let statuses = result["statuses"] as? [[String : AnyObject]] else {
                
                return
            }
            
            //遍历数组, 转化成模型  , 先去创建一个单条微博的模型
            for oneStatus in statuses {
             print("加载微博数据\(oneStatus)")
                //转模型, 去创建单条微博数据模型, 再回来转
                
            }
          
            }) { (_, error) -> Void in
                //错误处理
        }
    }
    func prepearForTableViewInfo (){
        //注册cell
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "HomeCell")
        //预估行高等等

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
