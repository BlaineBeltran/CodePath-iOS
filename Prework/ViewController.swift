//
//  ViewController.swift
//  Prework
//
//  Created by Blaine Beltran on 10/19/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextFild: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var customTipAmount: UITextField!
    
    private var tip: Double? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tipControl.selectedSegmentIndex = 3
    }

    @IBAction func calculateTipPressed(_ sender: UISegmentedControl) {
        
        customTipAmount.text = ""
        let tipPercentages = [0.15, 0.18, 0.20]
        if tipControl.selectedSegmentIndex != 3 {
            tip = tipPercentages[tipControl.selectedSegmentIndex]
        } else {
            customTipAmount.text = ""
            tip = nil
        }
       
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Double(billAmountTextFild.text!) ?? 0
        if let safeTip = tip {
            let newTip = bill * safeTip
            let total = bill + newTip
            
            tipAmountLabel.text = String(format: "$%.2f", newTip)
            totalLabel.text = String(format: "$%.2f", total)
        } else {
            let customTip = Double(customTipAmount.text!) ?? 0
            let customTotal = bill + customTip
            
            tipAmountLabel.text = String(format: "$%.2f", customTip)
            totalLabel.text = String(format: "$%.2f", customTotal)
            
        }
    }
}

