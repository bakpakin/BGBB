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
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var browseButton: UIButton!
    
    let pickerData = ["Harp and Bard", "B&G Drillers", "Fenway Franks", "Cool", "Wow"]
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.dataSource = self
        myPicker.delegate = self
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myLabel.text = pickerData[row]
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
}
