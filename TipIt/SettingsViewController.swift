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
    var seconds = 60
    var timer = Timer()
    var timerOn = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            resetDefaultTip()
            tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipDefaultIndex")

    }
    
    // sync default for tip
    func syncDefaultTip() {
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tipDefaultIndex")
        defaults.synchronize()
    }
    
    // reset selectedSegmentIndex for tip, sync
    func resetDefaultTip() {
        tipControl.selectedSegmentIndex = 0
        syncDefaultTip()
    }
    
    // triggered by selecting a new segment index. Sync, then countdown
    
    
    
    @IBAction func tipSelected(_ sender: UISegmentedControl) {
        syncDefaultTip()
        if(timerOn){
            resetTimer()
        }
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SettingsViewController.updateTimer)), userInfo: nil, repeats: true)
        timerOn = true
    }
    
    @objc func updateTimer() {
        if(seconds <= 0){
            resetTimer()
            resetDefaultTip()
        } else {
            seconds -= 1
        }
        print(String(seconds) + " ")
    }
    
    func resetTimer() {
        timer.invalidate()
        seconds = 60
        timerOn = false
    }
    
}

