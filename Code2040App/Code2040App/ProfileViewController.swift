//
//  FirstViewController.swift
//  Code2040App
//
//  Created by Jonnathan Petote on 11/4/16.
//  Copyright © 2016 JonnathanPetote. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let apiToken = "0a2f35e090a06e431c8ea842110ccd32"
    let endpoint = "http://challenge.code2040.org/api/dating"
    let returnpoint = "http://challenge.code2040.org/api/dating/validate"
    
    /*
     apiToken = '0a2f35e090a06e431c8ea842110ccd32'
     endpoint = 'http://challenge.code2040.org/api/dating'
     returnpoint = 'http://challenge.code2040.org/api/dating/validate'
     
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

