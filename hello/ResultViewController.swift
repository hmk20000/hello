//
//  ResultViewController.swift
//  hello
//
//  Created by ming on 2016. 7. 25..
//  Copyright © 2016년 mingu. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController:UIViewController{
    
    var name : String = ""
    
    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        self.nameLabel.text = name
    }
}