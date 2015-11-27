//
//  CustomTabBar.swift
//  weibo1
//
//  Created by WY on 15/11/26.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {// 自定义tabBar
    override init(frame: CGRect) {
        super.init(frame: frame)
//        print("这句话会打印吗")
        addButton ()//调用自定义的添加中间的那个黄色的加号按钮的方法 ,
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        self.addButton ()
    }
    override func layoutSubviews() {//在布局子控件方法中调整内部按钮的位置, 给黄加号腾出一个位置
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
//        self.addSubview(addBtn)//这一步调用有点多余
    }
    func addButton (){//自定义添加 加号按钮的方法
    
        self.addSubview(addBtn)//给自定义的tabBar添加加号按钮 ,
    }
    lazy var addBtn : UIButton = {//创建延迟存储属性(中间黄色的加号按钮), 并设置相关属性  
        let addBtnTemp = UIButton()
       
        //        addBtn.backgroundColor=themeColor
        addBtnTemp.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        addBtnTemp.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
        addBtnTemp.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
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
