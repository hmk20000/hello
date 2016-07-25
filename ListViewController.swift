//
//  ListViewController.swift
//  hello
//
//  Created by ming on 2016. 7. 25..
//  Copyright © 2016년 mingu. All rights reserved.
//

import UIKit

class ListViewController : UITableViewController{
    var list = Array<CampusVO>()
    override func viewDidLoad() {
        let apiURI = NSURL(string: "http://cccvlm.com/API/campus/")
        let apidata = NSData(contentsOfURL: apiURI!)
        //NSLog("API Result=%@",NSString(data:apidata!,encoding: NSUTF8StringEncoding)!)
        do{
            let apiDictionary = try NSJSONSerialization.JSONObjectWithData (apidata!, options:[]) as! NSDictionary
            
            //let campus = apiDictionary["0"] as! NSDictionary
            for (k,row) in apiDictionary{
                let cvo = CampusVO()
                cvo.name = "\(row),\(k)"
                
                self.list.append(cvo)
            }
        } catch{
            
        }
    }
    
    override func tableView(tableView:UITableView,numberOfRowsInSection section:Int)->Int{
        let count = self.list.count
        if  count > 10{
            return 10
        }else{
            return self.list.count
        }
    }
    
    override func tableView(tableView:UITableView,cellForRowAtIndexPath indexPath:NSIndexPath)->UITableViewCell{
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell")!
        cell.textLabel?.text = row.name
                return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("Touch Table Row at %d", indexPath.row)
        if let uvc = self.storyboard?.instantiateViewControllerWithIdentifier("VC4") as? ResultViewController{
            NSLog(self.list[indexPath.row].name!)
            uvc.name = self.list[indexPath.row].name!
            self.navigationController?.pushViewController(uvc, animated: true)
        }

    }
}
