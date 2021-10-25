//
//  SettingsViewController.swift
//  Prework
//
//  Created by Blaine Beltran on 10/25/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var darkModeToggle: UISwitch!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaults.object(forKey: "DarkModeState") != nil {
            darkModeToggle.isOn = defaults.bool(forKey: "DarkModeState")
        }
        if darkModeToggle.isOn == true{
            view.overrideUserInterfaceStyle = .dark
        } else {
            view.overrideUserInterfaceStyle = .light
        }
        
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    
    @IBAction func darkModePressed(_ sender: UISwitch) {
        if darkModeToggle.isOn {
            view.overrideUserInterfaceStyle = .dark
            defaults.set(true, forKey: "DarkModeState")
        } else {
            view.overrideUserInterfaceStyle = .light
            defaults.set(false, forKey: "DarkModeState")
        }
    }
}
