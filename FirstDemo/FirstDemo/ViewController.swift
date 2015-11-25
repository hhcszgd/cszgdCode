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
        let arr = [["name" : "格奥尔" , "age" : "80"],["name" : "格奥尔" , "age" : "80"],["name" : "格奥尔" , "age" : "80"],["name" : "格奥尔" , "age" : "80"],["name" : "格奥尔" , "age" : "80"]]
        for ddd in arr {
        
            var p : Person = Person.init(dic : ddd)
            print(p)
            persons.append(p)
        
        }
//        var dic : [String : String ] = ["name" : "格奥尔" , "age" : "80"]

//            let p : Person = Person.init(dic : dic)
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PersonCell
        cell.person = persons[indexPath.row]
//        cell.textLabel?.text = "this is title"
//        cell.detailTextLabel?.text = "this is detail title"
        return cell
    }

}

