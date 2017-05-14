//
//  SpringAnimatorConroller.swift
//  ViewAnimator
//
//  Created by William Miller on 5/13/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
//

import UIKit

class SpringAnimatorConroller: AnimatorController {
    
    enum ParamCellIdentifiers:Int {
        
        case durationCell = 0
        case delayCell
        case springDampingCell
        case velocityCell
        case optionsCell
        case propertiesCell
        case count
    }
    
    enum SpringAnimateCellIdentifiers:Int {
        
        case animateCell = 0
        case count
    }
    
    enum SectionIdentifiers:Int {
        
        case animateSection = 0
        case parameterSection
        case count
        
    }
    
    var duration = Double(1.0)
    var delay = Double(0.25)
    var sprintDamping = CGFloat(0.5)
    var velocity = CGFloat(0.5)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellIdentifiers = [ "SpringAnimationCellId", "DurationCellId", "DelayCellId", "SpringDampingCellId", "SpringVelocityCellId", "OptionsCellId", "PropertiesCellId"]
        
        sectionHeaderTitles = ["Spring Animation", "Parameters"]
        
        identifierBaseIdx = [0,
                             SpringAnimateCellIdentifiers.count.rawValue]
        
        sectionCount = [SpringAnimateCellIdentifiers.count.rawValue, ParamCellIdentifiers.count.rawValue]
        
        rowHeights = [CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0)]


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
    
    @IBAction func delayChanged(_ sender: UISlider) {
        
        delay = Double(sender.value)
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        
        formatter.maximumFractionDigits = 2
        
        formatter.minimumFractionDigits = 2
        
        formatter.maximumIntegerDigits = 2
        
        formatter.minimumIntegerDigits = 1
        
        let cell = sender.superview?.superview as! DelayCell
        
        cell.lblValue.text = formatter.string(from: NSNumber(value: sender.value))
        
    }
    @IBAction func springDampingChanged(_ sender: UISlider) {
        
        sprintDamping = CGFloat(sender.value)  //(sender.value)
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        
        formatter.maximumFractionDigits = 2
        
        formatter.minimumFractionDigits = 2
        
        formatter.maximumIntegerDigits = 2
        
        formatter.minimumIntegerDigits = 1
        
        let cell = sender.superview?.superview as! SpringDampingCell
        
        cell.lblValue.text = formatter.string(from: NSNumber(value: sender.value))
        
    }
    
    @IBAction func springVelocityChanged(_ sender: UISlider) {
        
        velocity = CGFloat(sender.value)
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        
        formatter.maximumFractionDigits = 2
        
        formatter.minimumFractionDigits = 2
        
        formatter.maximumIntegerDigits = 2
        
        formatter.minimumIntegerDigits = 1
        
        let cell = sender.superview?.superview as! VelocityCell
        
        cell.lblValue.text = formatter.string(from: NSNumber(value: sender.value))
        
    }
    
    @IBAction func executeSpringAnimation(_ sender: UIButton) {
        
        
        let cell = sender.superview?.superview as! AnimationCell
        
        let hex = String(format: "%x", SpringOptionsController.springOptions.rawValue)
        
        print("Options for animate are \(hex)")
        
        cell.executeAnimation(withDuration: duration, andDelay: delay, usingSpringwithDamping: sprintDamping, withInitialSpringVelocity: velocity, animationOptions: SpringOptionsController.springOptions)
        
    }
    
    
}
