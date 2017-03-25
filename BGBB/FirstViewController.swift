//
//  FirstViewController.swift
//  BGBB
//
//  Created by Calvin Rose on 10/6/16.
//  Copyright © 2016 Calvin Rose. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    
    //outlets
    @IBOutlet weak var MyTableView: UITableView!
    @IBOutlet weak var MyDivision: UILabel!
    @IBOutlet weak var MyWeekOf: UILabel!
    @IBOutlet weak var PickerDiv: UIPickerView!
    @IBOutlet weak var PickerWeek: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PickerDiv.dataSource = self
        PickerDiv.delegate = self
        PickerWeek.dataSource = self
        PickerWeek.delegate = self
        MyTableView.delegate = self
        MyTableView.dataSource = self
        self.MyTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    let pickerData1 = ["I", "II"]
    let pickerData2 = ["1", "2", "3"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == PickerDiv!{
            return pickerData1.count
            
        }
        else{
            return pickerData2.count
        }
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == PickerDiv!{
            return pickerData1[row]
            
        }
        else{
            return pickerData2[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        MyTableView.reloadData()
    }
    
    
    
    let tableData1 = ["Trophy Room vs Hallo Bar", "Fenway Franks vs DBar", "Cathedral Station vs B&G Drillers"]
    let tableData2 = ["SFI vs CSRB", "dbar vs Club Cafe D2", "ZC's vs TMT", "MW vs TR"]
    let cellReuseIdentifier = "cell"
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        if  pickerData1[self.PickerDiv.selectedRow(inComponent: 0)] == "I"{
            return tableData1.count
        }
        else{
            return tableData2.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if  pickerData1[self.PickerDiv.selectedRow(inComponent: 0)] == "I"{
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
            cell.textLabel?.text = tableData1[indexPath.row]
            return cell
        }
        else{
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
            cell.textLabel?.text = tableData2[indexPath.row]
            return cell
            
        }
    }
    
}


