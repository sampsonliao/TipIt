//
//  SettingsViewController.swift
//  TipIt
//
//  Created by Sampson Liao on 1/24/19.
//  Copyright © 2019 sliao. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(UserDefaults.standard.object(forKey: "tipDefaultIndex") == nil){
            tipControl.selectedSegmentIndex = 0
        } else {
            tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipDefaultIndex")
        }
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tipDefaultIndex")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
