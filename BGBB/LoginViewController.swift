//
//  LoginViewController.swift
//  BGBB_Options
//
//  Created by Nathan Canterbury on 3/25/17.
//  Copyright © 2017 Nathan Canterbury. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var myPicker: UIPickerView!
    
    
    @IBOutlet weak var browseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.dataSource = self
        myPicker.delegate = self
        LeagueData.single.addListener {
            self.myPicker.reloadAllComponents()
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (row == 0) {
            return "Pick your Team"
        } else {
            return LeagueData.single.teams[row - 1].name
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return LeagueData.single.teams.count + 1
    }
    
}
