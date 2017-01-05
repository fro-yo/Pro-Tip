//
//  SettingsController.swift
//  Pro Tip
//
//  Created by Ajeya Rengarajan on 1/6/17.
//  Copyright © 2017 Ajeya Rengarajan. All rights reserved.
//

import UIKit

class SettingsController : UIViewController {

    @IBOutlet weak var tipField1: UITextField!
    @IBOutlet weak var tipField2: UITextField!
    @IBOutlet weak var tipField3: UITextField!
    @IBOutlet weak var currencySelector: UISegmentedControl!
    
    var tipArray = [0.10, 0.15, 0.20]
    var tipArrayStrings = ["10%", "15%", "20%"]
    var currency: Character = "$"
    var currencyIndex: Int = 0
    
    @IBAction func onEditBegin(_ sender: UITextField) {
        sender.text = ""
    }
    
    @IBAction func onCurrencyChange(_ sender: UISegmentedControl) {
        currency = Character (sender.titleForSegment(at: sender.selectedSegmentIndex)!)
        currencyIndex = sender.selectedSegmentIndex
    }
    
    @IBAction func onEditEnd(_ sender: UITextField) {
        
        let index = Int (sender.restorationIdentifier!)!
        
        tipArray[index] = Double (sender.text!)! / 100
        sender.text = sender.text! + "%"
        tipArrayStrings[index] = sender.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipField1.text = tipArrayStrings[0]
        tipField2.text = tipArrayStrings[1]
        tipField3.text = tipArrayStrings[2]
        
        currencySelector.selectedSegmentIndex = currencyIndex
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
