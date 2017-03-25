//
//  OptionsViewController.swift
//  BGBB_Options
//
//  Created by Nathan Canterbury on 3/24/17.
//  Copyright © 2017 Nathan Canterbury. All rights reserved.
//

import UIKit

class OptionsViewController : UIViewController {
    
    
    
    @IBOutlet var faqButton: UIButton!
    @IBOutlet var contactUs: UIButton!
    @IBOutlet var aboutUs: UIButton!
    @IBOutlet var changeTeam: UIButton!
    @IBOutlet var facebookMedia: UIButton!
    @IBOutlet var twitterMedia: UIButton!
   
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
   
        let buttonsList = [faqButton, contactUs, aboutUs, changeTeam, facebookMedia, twitterMedia]
        
        for button in buttonsList {
            
            if let newButton = button {
            newButton.backgroundColor = .clear
            newButton.layer.cornerRadius = 2
            newButton.layer.borderWidth = 0.5
            newButton.layer.borderColor = UIColor.black.cgColor
                
            }
        }
    }
    
    
    @IBAction func contactUsPush(_ sender: Any) {
        if let url = URL(string: "http://bgbl.com/contact-page/") {
            UIApplication.shared.open(url)
        }
    }
    
    
    
    @IBAction func twitterMediaPush(_ sender: Any) {
        if let url = URL(string: "https://twitter.com/TheBGBL") {
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func facebookMediaPush(_ sender: Any) {
        if let url = URL(string: "https://www.facebook.com/groups/bostongaybasketballleague/") {
            UIApplication.shared.open(url)
        }
    }
    
    
  
    
   
    
    
}
