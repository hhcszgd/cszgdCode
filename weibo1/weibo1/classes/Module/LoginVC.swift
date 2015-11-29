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
//        let js = "document.getElementById('userId').value = 'daoge10000@sina.cn';" +
//        "document.getElementById('passwd').value = 'qqq123';"
        let js = "document.getElementById('userId').value = 'leiggee@126.com', document.getElementById('passwd').value = 'oyonomg' "        //为什么非要用小雷的账号密码才可以呢???
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

    func webViewDidFinishLoad (webView: UIWebView){
    SVProgressHUD.dismiss()
    
    }
    
    // 实现webView的代理方法, 跟踪请求所相应的信息
 //    - (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print ("打印打印打印:\(request)")
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
            //request.URL?的值是http://www.itcast.cn/?code=b245d8a9945b2a941168aeae3c2fb798
            //request.URL?.query的值是code=b245d8a9945b2a941168aeae3c2fb798
            //获取不到参数列表
            return false
        }
        print("看看 \(query)")

        let codeStr = "code="
        let code = query.substringFromIndex(codeStr.endIndex)
        //在这里创建一个viewModel 模型, 把获取token的数据都放在viewModel对应的类的方法中, 在通过对象方去调用方法,这个方法必须要有一个回调的闭包, 因为在获取完成token之后, 还要做一些处理, 比如提示数据加载失败还是成功
        
        let viewModel1 = UserAccountViewModel()//创建
        
        
        
        
        
        
        //调用
        viewModel1.loadToken(code) { (error) -> () in
            //回调内容,
//            判断error是否为空, 如果为空提示网络不好, 如果成功提示, 加载成功
            if error != nil {
            //加载失败
            SVProgressHUD.showErrorWithStatus("网络繁忙 请稍后再试")
                return
            }
            //能走到这里说明加载成功
            
        }
        self.dismissViewControllerAnimated(false) { () -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName(JumpVCNotification, object: "toWelcome")
            //注意是先销毁上一个控制器, 还是先发通知的顺序问题
        }
        //MARK: 在这里发送跳转欢迎界面的通知
        SVProgressHUD.showSuccessWithStatus("加载成功") //可以跳转  欢迎界面  的控制器了,
//        NSNotificationCenter.defaultCenter().postNotificationName(JumpVCNotification, object: "toWelcome")
        
        /**微博开发者平注册的 应用信息
        let redirect_uri = "http://www.itcast.cn"
        let client_id = "583790955"
        */
        /**点击导航栏的 "登录" 按钮 打印的请求链接
        <NSMutableURLRequest: 0x7f9069e327d0> { URL: https://api.weibo.com/oauth2/authorize?client_id=583790955&redirect_uri=http://www.itcast.cn }
        */
        /**点击注册按钮 打印的请求链接
        <NSMutableURLRequest: 0x7f9069e7b9c0> { URL: http://weibo.cn/dpool/ttt/h5/reg.php?wm=4406&appsrc=WfUcr&backURL=https%3A%2F%2Fapi.weibo.com%2F2%2Foauth2%2Fauthorize%3Fclient_id%3D583790955%26response_type%3Dcode%26display%3Dmobile%26redirect_uri%3Dhttp%253A%252F%252Fwww.itcast.cn%26from%3D%26with_cookie%3D }
        */
        /**输入账号密码后点击登录按钮 打印的请求链接
        <NSMutableURLRequest: 0x7f906c246620> { URL: https://api.weibo.com/oauth2/authorize }
        */
        /**点击授权打印的请求链接
        打印打印打印:<NSMutableURLRequest: 0x7f989af10510> { URL: https://api.weibo.com/oauth2/authorize# }
        打印打印打印:<NSMutableURLRequest: 0x7f989ae2eea0> { URL: https://api.weibo.com/oauth2/authorize }
        打印打印打印:<NSMutableURLRequest: 0x7f989d0c4060> { URL: http://www.itcast.cn/?code=12af58d1f5b71a2ae9952f03bd636cc8 }

        */
        
        //获取到code码
        //请求用户token
//        loadAccessToken(code)
//                return true
        SVProgressHUD.dismiss()
        return false//怎么反回false ??因为不想让它跳转到回调网址, 后期会让它调到我们指定的微博页面的

    }

}
/**点击换个账号打印的链接 ,  没用, 打印着玩的
<NSMutableURLRequest: 0x7f9069e84820> { URL: http://login.sina.com.cn/sso/logout.php?entry=openapi&r=https%3A%2F%2Fapi.weibo.com%2Foauth2%2Fauthorize%3Fclient_id%3D583790955%26redirect_uri%3Dhttp%3A%2F%2Fwww.itcast.cn }
*/
