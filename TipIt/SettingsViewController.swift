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
    
    @IBOutlet weak var defaultTipLabel: UILabel!
    
    @IBOutlet weak var appearanceLabel: UILabel!
    
    
    @IBOutlet weak var darkModeLabel: UILabel!
    
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var defaultTipView: UIView!
    @IBOutlet weak var appearanceView: UIView!
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipView.backgroundColor = CustomColor.Light.LabelShade
        appearanceView.backgroundColor = CustomColor.Light.LabelShade
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setBackgroundColor()
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
        if(seconds < 0){
            resetTimer()
            resetDefaultTip()
        } else {
            seconds -= 1
        }
    }
    
    func resetTimer() {
        timer.invalidate()
        seconds = 60
        timerOn = false
    }
    
    func setBackgroundColor() {
        if(defaults.bool(forKey: "darkMode")){
            darkModeSwitch.setOn(true, animated: true)
            setDarkColors()
        } else {
            darkModeSwitch.setOn(false, animated: true)
            setDefaultColors()
        }
    }
    
    
    @IBAction func darkModeOn(_ sender: UISwitch) {
        defaults.set(sender.isOn, forKey: "darkMode")
        setBackgroundColor()
    }
    
    func setDefaultColors() {
        defaultTipLabel.textColor = UIColor.black
        appearanceLabel.textColor = UIColor.black
        darkModeLabel.textColor = UIColor.black
        
        mainView.backgroundColor = UIColor.white
        defaultTipView.backgroundColor = CustomColor.Light.LabelShade
        appearanceView.backgroundColor = CustomColor.Light.LabelShade
    }
    
    func setDarkColors() {
        defaultTipLabel.textColor = UIColor.white
        appearanceLabel.textColor = UIColor.white
        darkModeLabel.textColor = UIColor.white
        
        mainView.backgroundColor = CustomColor.Dark.Background
        defaultTipView.backgroundColor = CustomColor.Dark.LabelShade
        appearanceView.backgroundColor = CustomColor.Dark.LabelShade
    }
    
}




