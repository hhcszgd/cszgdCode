//
//  LoginVC.swift
//  weibo1
//
//  Created by WY on 15/11/27.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
//:MARK 输入账号密码的登录控制器
class LoginVC: UIViewController , UIWebViewDelegate {
let webView = UIWebView()
    override func viewDidLoad() {
        super.viewDidLoad()


        loadWebPage()//调用自定义的加载网页的方法
        // Do any additional setup after loading the view.
    }
    override func loadView() {//在loadView方法中设置导航栏的关闭按钮和显示标题
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .Plain, target: self, action: "closeThisVC")
        view = webView//把根View换成webView
        title = "我要登录 "
        webView.delegate  =  self // webView是需要代理的
    }
    func loadWebPage (){//自定义的加载网页的方法
        let string : String =  "https://api.weibo.com/oauth2/authorize?" + "client_id=" + client_id + "&redirect_uri=" + redirect_uri
        let url = NSURL(string: string)
        let   request = NSURLRequest(URL : url!)
        webView.loadRequest(request)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeThisVC (){
        dismissViewControllerAnimated(true , completion: nil)
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
