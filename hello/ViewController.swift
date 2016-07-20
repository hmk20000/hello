//
//  ViewController.swift
//  hello
//
//  Created by sungwoo on 2016. 7. 20..
//  Copyright © 2016년 mingu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTitle: UILabel!
    override func viewDidLoad() {
        let apiURI = NSURL(string: "http://ip.jsontest.com")
        let apidata : NSData? = NSData(contentsOfURL: apiURI!)
        NSLog("API Result=%@",NSString(data:apidata!,encoding: NSUTF8StringEncoding)!)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sayHello(sender: AnyObject) {
        self.uiTitle.text = "Hello, World!"
    }

    @IBAction func moveNext(sender: AnyObject) {
        if let uvc = self.storyboard?.instantiateViewControllerWithIdentifier("SecondVC"){
            uvc.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
            self.presentViewController(uvc, animated: true, completion: nil)
        }
    }
}

