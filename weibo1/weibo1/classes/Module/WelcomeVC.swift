//
//  WelcomeVC.swift
//  weibo1
//
//  Created by WY on 15/11/29.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
//导入自动布局框架,设置头像和文字和背景图的imgView
import SVProgressHUD
//导入SDWebImage,设置头像图片
import SDWebImage
class WelcomeVC: UIViewController {

  lazy  var welcomeImgView = UIImageView(image: UIImage(named: "ad_background"))
    lazy var iconImgView = UIImageView(image: UIImage(named: "avatar_default_big"))
    lazy var welcomeLabel : UILabel = {
       
        var account = UserAccountViewModel()
//        let name = UserAccountViewModel().account!.name
//        print("WelcomeVC的用户模型是否有值\(account)")
//        print("WelcomeVC的用户模型的account是否有值\(account.account)")
//        print("WelcomeVC的用户模型token是否有值\(account.token)")
        
                var name = account.userName

         var tempLabel = UILabel(titleStr: name! + "  欢迎回来", fontSize: 22.0, titleColor: UIColor.darkGrayColor())
//        tempLabel.text = name! + "  欢迎回来"
//        tempLabel.font = UIFont.systemFontOfSize(22.0)
//        tempLabel.textColor = UIColor.darkGrayColor()
//        tempLabel.textAlignment = NSTextAlignment.Center
//        tempLabel.sizeToFit()
        return tempLabel
    }()
    override func loadView() {
        view = welcomeImgView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        // Do any additional setup after loading the view.
    }
    func layoutUI (){
//        let icon = iconImgView.sd_setImageWithURL(UserAccountViewModel().account.avatar_large, completed: <#T##SDWebImageCompletionBlock!##SDWebImageCompletionBlock!##(UIImage!, NSError!, SDImageCacheType, NSURL!) -> Void#>)
//        let url = NSURL( UserAccountViewModel().headImageURL)
        
        
        
    iconImgView.sd_setImageWithURL(UserAccountViewModel().headImageURL, placeholderImage: UIImage(named: "avatar_default_big"))
        view.addSubview(iconImgView)
        view.addSubview(welcomeLabel)
        //好吧, 开始自动布局, 早晚都跑不掉的
        iconImgView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(view.snp_top).offset(10)
            make.centerX.equalTo(view.snp_centerX)
        }
        iconImgView.layer.cornerRadius = 80
//        iconImgView.clipsToBounds = true
        iconImgView.layer.masksToBounds = true

        
        welcomeLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(iconImgView.snp_bottom).offset(10)
            make.centerX.equalTo(iconImgView.snp_centerX)
        }
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        iconImgView.snp_updateConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp_top).offset(100)//通过改变约束来实现动画效果的前提是, 两次改得都是都是同一个方向上得约束
            //设置的时自己相对于其他控件的顶部的, 那么改得时候也必须只能改自己的顶部相对于的控件的顶部的约束
//            make.bottom.equalTo(self.view.snp_bottom).offset(399)
        }

        UIView.animateWithDuration(3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 9.0, options: [], animations: { () -> Void in
            self.view.layoutIfNeeded()
            }) { (_) -> Void in
//                print("欢迎页面加载完成,跳转到主视图控制器")
                //在这儿发送通知
                NSNotificationCenter.defaultCenter().postNotificationName(JumpVCNotification, object: nil)
        }
    
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
