//
//  LoginVC.swift
//  weibo1
//
//  Created by WY on 15/11/27.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
import AFNetworking

import SVProgressHUD
//MARK: 输入账号密码的登录控制器
class LoginVC: UIViewController   {
let webView = UIWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .Plain, target: self, action: "closeThisVC")
        navigationItem.rightBarButtonItem=UIBarButtonItem(title: "自动填充", style: .Plain, target: self, action: "autoAccount")
           title = "我要登录 "
        loadWebPage()//调用自定义的加载网页的方法
        // Do any additional setup after loading the view.
    }
    override func loadView() {//在loadView方法中设置导航栏的关闭按钮和显示标题

        view = webView//把根View换成webView
     
        webView.delegate  =  self // webView是需要代理的
    }

    
    func autoAccount (){
        print("自动填充账号信息")
        let js = "document.getElementById('userId').value = 'daoge10000@sina.cn';" +
        "document.getElementById('passwd').value = 'qqq123';"
        
        webView.stringByEvaluatingJavaScriptFromString(js)
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
//使用extension为当前类扩展协议方法,(这样更加模块儿化)
extension LoginVC  : UIWebViewDelegate{

    //代理方法
    func webViewDidStartLoad(webView: UIWebView){
        SVProgressHUD.show()
        
    }
//    - (void)webViewDidStartLoad:(UIWebView *)webView;
//    func webViewDidStartLoad(){
//        SVProgressHUD.show()
//
//    }
//    - (void)webViewDidFinishLoad:(UIWebView *)webView;
    func webViewDidFinishLoad (webView: UIWebView){
//    SVProgressHUD.dismiss()
    }
    
    // 实现webView的代理方法, 跟踪请求所相应的信息
 //    - (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request)
        //js  调用本地代码
        let urlString = request.URL?.absoluteString ?? ""
        
        //屏蔽掉不希望加载的页面
        if urlString.hasPrefix("https://api.weibo.com/") {
            return true
        }
        
        if !urlString.hasPrefix("http://www.itcast.cn") {
            return false
        }
        //程序如果走到这里  就只有包含回调的url才能运行到此
        
        //获取授权码
        guard let query = request.URL?.query else {
            //获取不到参数列表
            return false
        }
        let codeStr = "code="
        let code = query.substringFromIndex(codeStr.endIndex)
        //获取到code码
        //请求用户token
//        loadAccessToken(code)
        return false
    }

}
