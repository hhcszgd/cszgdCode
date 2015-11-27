//
//  CustomTabBar.swift
//  weibo1
//
//  Created by WY on 15/11/26.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("这句话会打印吗")
        addButton ()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        addButton ()
    }
    override func layoutSubviews() {
        var i : CGFloat = 0
        let barButtonW   = screenW/5
        let barButtonH = self.bounds.height
        let rect = CGRectMake(0, 0, barButtonW, barButtonH)
        for item in self.subviews {
            if item.isKindOfClass(NSClassFromString("UITabBarButton")!){
            item.frame=CGRectOffset(rect, barButtonW*i, 0)
                i += (i==1 ? 2 : 1)
            }
        }
        addBtn.frame=CGRectOffset(rect, barButtonW*2, 0)
//        CGRectOffset(<#T##rect: CGRect##CGRect#>, <#T##dx: CGFloat##CGFloat#>, <#T##dy: CGFloat##CGFloat#>)
        self.addSubview(addBtn)
    }
    func addButton (){
    
        self.addSubview(addBtn)
    }
    lazy var addBtn : UIButton = {
        let addBtnTemp = UIButton()
       
        //        addBtn.backgroundColor=themeColor
        addBtnTemp.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        addBtnTemp.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
        addBtnTemp.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
//        addBtnTemp.backgroundColor=themeColor
        addBtnTemp.setBackgroundImage((UIImage(named: "tabbar_compose_button_highlighted")), forState: .Highlighted)
        addBtnTemp.sizeToFit()
//        addBtnTemp.frame.origin.y=0
//        addBtnTemp.frame.origin.x=screenW/5*2  //在这设置没用tmd的为什么
        return addBtnTemp
    }()
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
