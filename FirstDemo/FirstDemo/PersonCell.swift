//
//  PersonCell.swift
//  FirstDemo
//
//  Created by WY on 15/11/25.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit 

class PersonCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    var person : Person  {
        set {
//            self.nameLabel.text = person.name
            self.nameLabel.text = newValue.name

//            self.ageLabel.text = person.age
            self.ageLabel.text = newValue.age

        }
        get {
            self.person.name = self.nameLabel.text
            self.person.age = self.ageLabel.text!
            return self.person
        }
    
    }
    
    
}
