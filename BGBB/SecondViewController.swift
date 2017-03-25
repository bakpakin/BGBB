//
//  SecondViewController.swift
//  BGBB
//
//  Created by Calvin Rose on 10/6/16.
//  Copyright © 2016 Calvin Rose. All rights reserved.
//

import UIKit
import Alamofire


class SecondViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getWebData(_ sender: AnyObject) {
        Alamofire.request("http://bgbl.com/").responseString { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }

}

