//
//  PrefixViewController.swift
//  Code2040App
//
//  Created by Jonnathan Petote on 11/5/16.
//  Copyright © 2016 JonnathanPetote. All rights reserved.
//

import UIKit

let apiToken = "0a2f35e090a06e431c8ea842110ccd32"
let endpoint = "http://challenge.code2040.org/api/prefix"
let returnpoint = "http://challenge.code2040.org/api/prefix/validate"

class PrefixViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func prefixAction(sender: AnyObject) {
        dispatch_async(dispatch_get_main_queue()){
            let request = NSMutableURLRequest(URL: NSURL(string: endpoint)!)
            request.HTTPMethod = "POST"
            request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(["token" : apiToken], options: .PrettyPrinted)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
                guard error == nil && data != nil else {
                    // check for fundamental networking error
                    print("error=\(error)")
                    return
                }
                if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {
                    // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response)")
                }
                
                let serializedResponse = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                
                let dict = serializedResponse as? Dictionary<String, AnyObject>
                
                if let remove = dict!["prefix"] as? String, let arr = dict!["array"] as? [String] {
                    let prefix = self.removePrefix(remove, arr: arr)
                    
                    //print("size: ")
                    //print(dict?.count)
                    //print(dict)
                    print("The word im checking is: ")
                    print(remove)
                    print("!!!!!!!!!!Array: ")
                    print(arr)
                    print("Prefix array: ")
                    print(prefix)
                    
                }
                
            }
            
            task.resume()
        }
        
        
        
        
        
        
        
    }
    
    
    func removePrefix(remove: String, arr: [String]) -> [String] {
        var prefixArr = [String]()
        for s in arr {
            if !s.hasPrefix(remove) {
                prefixArr.append(s)
            }
        }
        return prefixArr
    }
    
}