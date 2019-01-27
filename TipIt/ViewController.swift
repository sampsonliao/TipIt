//
//  ViewController.swift
//  TipIt
//
//  Created by Sampson Liao on 1/23/19.
//  Copyright © 2019 sliao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var billLabel: UILabel!
    
    
    @IBOutlet weak var tipLabelLabel: UILabel!
    
    @IBOutlet weak var totalLabelLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        defaults.set(0, forKey: "tipDefaultIndex")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(defaults.bool(forKey: "darkMode")){
            setDarkColors()
        } else {
            setDefaultColors()
        }
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipDefaultIndex")
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func setDefaultColors() {
        billLabel.textColor = UIColor.black
        tipLabelLabel.textColor = UIColor.black
        totalLabelLabel.textColor = UIColor.black
        
        billField.backgroundColor = UIColor.white
        billField.textColor = UIColor.black
        tipLabel.textColor = UIColor.black
        totalLabel.textColor = UIColor.black
        
        mainView.backgroundColor = UIColor.white
    }
    
    func setDarkColors() {
        billLabel.textColor = UIColor.white
        tipLabelLabel.textColor = UIColor.white
        totalLabelLabel.textColor = UIColor.white
        
        billField.backgroundColor = CustomColor.Dark.LabelShade
        billField.textColor = UIColor.white
        tipLabel.textColor = UIColor.white
        totalLabel.textColor = UIColor.white
        
        mainView.backgroundColor = CustomColor.Dark.Background
    }
}

struct CustomColor {
    struct Dark {
        static let Background = UIColor(red: 33, green: 33, blue: 33)
        static let LabelShade = UIColor(red: 10, green: 10, blue: 10)
    }
    
    struct Light {
        static let LabelShade = UIColor(red: 250, green: 250, blue: 250)
    }
}



