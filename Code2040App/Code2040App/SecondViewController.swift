//
//  SecondViewController.swift
//  Code2040App
//
//  Created by Jonnathan Petote on 11/4/16.
//  Copyright © 2016 JonnathanPetote. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate  {

    
    @IBOutlet weak var origString: UILabel!
    @IBOutlet weak var showString: UILabel!
    
    
    let apiToken = "0a2f35e090a06e431c8ea842110ccd32"
    let endpoint = "http://challenge.code2040.org/api/reverse"
    let returnpoint = "http://challenge.code2040.org/api/reverse/validate"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //stringToBeReversed.delegate = self //set delegate to textfile
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func reverseStringAction(sender: AnyObject) {
        
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
                
            let responseString = String(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
                
            dispatch_async(dispatch_get_main_queue()){
                self.origString.text = responseString
                self.showString.text = self.reverseString(responseString!)
            }
                
                
        }
        task.resume()
    }
    
    
    func reverseString(s:String) -> String {
        return String(s.characters.reverse())
    }
    
    
        
}


