//
//  ViewController.swift
//  Pro Tip
//
//  Created by Ajeya Rengarajan on 12/31/16.
//  Copyright © 2016 Ajeya Rengarajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    var tipArray = [0.10, 0.15, 0.20]
    var tipArrayStrings = ["10%", "15%", "20%"]
    var tipPercent: Double = 0.15
    var tipIndex: Int = 1
    
    var currency : Character = "$"
    var currentTip : Double = 0
    var currentTotal: Double = 0
    var currencyIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //amountText.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tipChanged(_ sender: AnyObject) {
        tipIndex = tipSelector.selectedSegmentIndex;
        onAmountChange(sender);
    }

    @IBAction func onAmountChange(_ sender: AnyObject) {
        
        if sender.text != "" {
            tipPercent = tipArray[tipIndex];
            var amountString = amountText.text!
            amountString.remove (at: amountString.startIndex)
            
            let amount = Double(amountString) ?? 0
            currentTip = tipPercent * amount
            currentTotal = amount + currentTip;
            
            tipLabel.text = String (format: String(currency)+"%.2f", currentTip)
            totalLabel.text = String (format: String(currency)+"%.2f", currentTotal)
        }
        
        else {
            amountText.text = String(currency)+"0"
            tipLabel.text = String(currency)+"0.00"
            totalLabel.text = String(currency)+"0.00"
        }
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "settingsSegue" {
            let settingsController = segue.destination as! SettingsController
            settingsController.tipArray = tipArray
            settingsController.tipArrayStrings = tipArrayStrings
            settingsController.currency = currency
            settingsController.currencyIndex = currencyIndex
        }   
    }
    
    @IBAction func saveSettings (segue: UIStoryboardSegue) {
        let settingsController = segue.source as! SettingsController
        currency = settingsController.currency;
        tipArray = settingsController.tipArray;
        currencyIndex = settingsController.currencyIndex
        tipArrayStrings = settingsController.tipArrayStrings;
        tipSelector.setTitle(tipArrayStrings[0], forSegmentAt: 0)
        tipSelector.setTitle(tipArrayStrings[1], forSegmentAt: 1)
        tipSelector.setTitle(tipArrayStrings[2], forSegmentAt: 2)
        updateCurrency();
        onAmountChange(amountText)
    }
    
    func updateCurrency () {
        tipLabel.text = String (format: String(currency)+"%.2f", currentTip)
        totalLabel.text = String (format: String(currency)+"%.2f", currentTotal)
        
        if ((amountText.text?.characters.count)! > 1) {
            var amountString = amountText.text!
            amountString.remove (at: amountString.startIndex)
            amountText.text = String(currency) + amountString
        }
            
        else {
            amountText.text = String(currency)
        }
    }

}

