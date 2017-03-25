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
        let collector = WebsiteData()
        let data = LeagueData()
        collector.getData(dataStore: data)
    }

}

