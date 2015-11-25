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
    override init(){}
    init(dic : [String : AnyObject]) {
    
        super.init()
        self.setValuesForKeysWithDictionary(dic)
        
    }
    override var description : String{
    let keyArr  = ["name" , "age"]
    let valueArr = dictionaryWithValuesForKeys(keyArr)
    return valueArr.description
    }
}
