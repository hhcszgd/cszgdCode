//
//  LoginVC.swift
//  weibo1
//
//  Created by WY on 15/11/27.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

class LoginVC: UIViewController , UIWebViewDelegate {
let webView = UIWebView()
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .Plain, target: self, action: "closeThisVC")
        loadWebPage()
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        view = webView
        webView.delegate  =  self
    }
    func loadWebPage (){
        let string : String =  "https://api.weibo.com/oauth2/authorize?" + "client_id=" + "client_id" + "&redirect_uri=" + "redirect_uri"
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
