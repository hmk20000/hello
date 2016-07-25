//
//  network.swift
//  hello
//
//  Created by ming on 2016. 7. 25..
//  Copyright © 2016년 mingu. All rights reserved.
//

import Foundation

class network{
    func HttpGet(URL:String,post:String)->String{
        let request = NSMutableURLRequest(URL: NSURL(string: URL)!)
        request.HTTPMethod = "POST"
        let postString = post
        var rtn=""
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in guard error == nil && data != nil else {                                                          // check for fundamental networking error
            rtn += "error=\(error)"
            return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                rtn+="statusCode should be 200, but is \(httpStatus.statusCode)"
                rtn+="response = \(response)"
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            rtn += "responseString = \(responseString)"
        }
        task.resume()

        return rtn
    }
}