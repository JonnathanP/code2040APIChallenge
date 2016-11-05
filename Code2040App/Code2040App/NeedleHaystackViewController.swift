//
//  needleHaystack.swift
//  Code2040App
//
//  Created by Jonnathan Petote on 11/5/16.
//  Copyright © 2016 JonnathanPetote. All rights reserved.
//

import UIKit

class NeedleHaystackViewController: UIViewController {
    
    let apiToken = "0a2f35e090a06e431c8ea842110ccd32"
    let endpoint = "http://challenge.code2040.org/api/haystack"
    let returnpoint = "http://challenge.code2040.org/api/haystack/validate"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //stringToBeReversed.delegate = self //set delegate to textfile
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func indexAction(sender: AnyObject) {
        
        dispatch_async(dispatch_get_main_queue()){
            let request = NSMutableURLRequest(URL: NSURL(string: self.endpoint)!)
            request.HTTPMethod = "POST"
            request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(["token" : self.apiToken], options: .PrettyPrinted)
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
                
                if let needle = dict!["needle"] as? String, let haystack = dict!["haystack"] as? [String] {
                    let index = self.needleHaystack(needle, haystack: haystack)
                    
                        print("size: ")
                        print(dict?.count)
                        print(dict)
                        print(index)
                    
                }
            
            }
           
            task.resume()
        }
        
        
    }
    

    
    
    func needleHaystack(needle: String, haystack: [String]) -> Int {
        for i in 0..<haystack.count {
            if haystack[i] == needle {
                return i
            }
        }
        return -1
    }
    
    
    
    
}