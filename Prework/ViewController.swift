//
//  ViewController.swift
//  Prework
//
//  Created by Blaine Beltran on 10/19/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var billAmountTextFild: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var customTipAmount: UITextField!
    
    let defaults = UserDefaults.standard
    
    private var tip: Double? = nil
    

    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billAmountTextFild.delegate = self
        self.customTipAmount.delegate = self
        self.tipControl.selectedSegmentIndex = 3
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaults.bool(forKey: Constants.darkModeDefaultsKey) == true {
            view.overrideUserInterfaceStyle = .dark
        } else {
            view.overrideUserInterfaceStyle = .light
        }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.billAmountTextFild.becomeFirstResponder()
    }
    
    //MARK: - TextField Delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case billAmountTextFild:
            customTipAmount.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
            
        }
        return false
    }

    //MARK: - Button Actions
    
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
        
        view.endEditing(true)
        
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
    @IBAction func settingPressed(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: Constants.settingsSegueIdentifier, sender: self)
    }
}

