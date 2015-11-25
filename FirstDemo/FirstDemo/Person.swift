//
//  Person.swift
//  FirstDemo
//
//  Created by WY on 15/11/25.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name : String?
    var age : String =  "0"
    init(dic : [String : AnyObject]) {
    
        super.init()
        self.setValuesForKeysWithDictionary(dic)
        
    }
}
