//
//  TransitionController.swift
//  ViewAnimator
//
//  Created by William Miller on 5/13/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
//

import UIKit

class TransitionController: AnimatorController {
    
    enum ParamCellIdentifiers:Int {
        
        case durationCell = 0
        case optionsCell
        case count
    }
    
    enum TransitionCellIdentifiers:Int {
        
        case transitionCell = 0
        case count
    }
    
    
    enum SectionIdentifiers:Int {
        
        case transitionSection = 0
        case parameterSection
        case count
        
    }
    
    var duration = Double(1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellIdentifiers = [ "TransitionCell", "DurationCellId", "OptionsCellId"]
        
        sectionHeaderTitles = ["Transition", "Parameters"]
        
        identifierBaseIdx = [0,
                             TransitionCellIdentifiers.count.rawValue]
        
        sectionCount = [TransitionCellIdentifiers.count.rawValue, ParamCellIdentifiers.count.rawValue]
        
        rowHeights = [CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0)]


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func durationChanged(_ sender: UISlider) {
        
        duration = Double(sender.value)
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        
        formatter.maximumFractionDigits = 2
        
        formatter.minimumFractionDigits = 2
        
        formatter.maximumIntegerDigits = 2
        
        formatter.minimumIntegerDigits = 1
        
        let cell = sender.superview?.superview as! DurationCell
        
        cell.lblValue.text = formatter.string(from: NSNumber(value: sender.value))
        
    }
    
    @IBAction func executeTransition(_ sender: UIButton) {
        
        let cell = sender.superview?.superview as! TransitionCell
        
        let hex = String(format: "%x", TransitionOptionsController.transitionOptions.rawValue)
        
        print("Options for animate are \(hex)")
        
        cell.executeTransition(withDuration: duration, animationOptions: TransitionOptionsController.transitionOptions)
        
    }

}
