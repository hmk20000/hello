//
//  SecondViewController.swift
//  hello
//
//  Created by sungwoo on 2016. 7. 20..
//  Copyright © 2016년 mingu. All rights reserved.
//

//import Foundation
import UIKit

class SecondViewController: UIViewController {
    @IBAction func dismiss(sender: AnyObject) {
        
    }
    @IBAction func moveBynavi(sender: AnyObject) {
        if let uvc = self.storyboard?.instantiateViewControllerWithIdentifier("ThirdVC"){
            self.navigationController?.pushViewController(uvc, animated: true)
        }
    }
}