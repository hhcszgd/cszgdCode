//
//  ViewController.swift
//  FirstDemo
//
//  Created by WY on 15/11/25.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var persons = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        let arr = [["name" : "格奥尔" , "age" : "80"],["name" : "格奥尔" , "age" : "80"],["name" : "格奥尔" , "age" : "80"],["name" : "格奥尔" , "age" : "80"],["name" : "格奥尔" , "age" : "80"]]
//        for ddd in arr {
//        
//            let p : Person = Person.init(dic : ddd)
//            print(p)
//            persons.append(p)
//        }

        self.loadData { (p) -> () in
            self.persons = p//在闭包里使用成员变量一定要加self.
            print(self.persons)
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    func loadData (finishBlockCallBack : ([Person]) -> () ){
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            
            var tempArr : [Person] = [Person]()
            for _ in 0...25 {
                let name : String = "马德里"
                let age : String = "\(random()%30)"
//                let p = Person()
//                p.name = name
//                p.age = age
                let dic : [String : AnyObject] = ["name" : name , "age" : age]
                let p = Person.init(dic: dic)
                
                tempArr.append(p)
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                finishBlockCallBack (tempArr)

            })
            
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
extension ViewController {


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PersonCell
        cell.person = persons[indexPath.row]
        
        return cell
    }



}
