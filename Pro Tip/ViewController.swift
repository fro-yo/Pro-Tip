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
    
    var tipPercent: Double = 0.15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tipChanged(_ sender: AnyObject) {
        let currentIndex = tipSelector.selectedSegmentIndex;
        
        var title: String = tipSelector.titleForSegment(at: currentIndex)!
        
        print (title)
        title.remove(at: title.index(before: title.endIndex))
        
        print (title)
        
        tipPercent = Double (title) ?? 0
        tipPercent = tipPercent * 0.01
        onAmountChange(sender);
    }

    @IBAction func onAmountChange(_ sender: AnyObject) {
        
        let amount = Double(amountText.text!) ?? 0
        let tip = tipPercent * amount
        let total = amount + tip;
        
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
    }
    
    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
}

