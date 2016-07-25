//
//  ViewController.swift
//  hello
//
//  Created by sungwoo on 2016. 7. 20..
//  Copyright © 2016년 mingu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var apidata:NSData?
    @IBOutlet var uiTitle: UILabel!
    override func viewDidLoad() {
        let apiURI = NSURL(string: "http://cccvlm.com/API/campus/")
        apidata = NSData(contentsOfURL: apiURI!)
        //NSLog("API Result=%@",NSString(data:apidata!,encoding: NSUTF8StringEncoding)!)
        do{
            let apiDictionary = try NSJSONSerialization.JSONObjectWithData (apidata!, options:[]) as! NSDictionary
            
            //let campus = apiDictionary["0"] as! NSDictionary
            var cvo : CampusVO
            
            cvo = CampusVO()
            for (k,row) in apiDictionary{
                cvo.name = row["\(k)"] as? String
                print("\(row)")
            }
        } catch{
            
        }
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
        let test = network().HttpGet("http://cccvlm.com/API/login/index.php",post:"id=01072110785&pw=1")
        NSLog(test)
        /*if let uvc = self.storyboard?.instantiateViewControllerWithIdentifier("SecondVC"){
            uvc.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
            self.presentViewController(uvc, animated: true, completion: nil)
        }*/
    }
}