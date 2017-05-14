//
//  CurveAnimatorController.swift
//  ViewAnimator
//
//  Created by William Miller on 5/13/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
//

import UIKit

class CurveAnimatorController: AnimatorController {
    
    enum ParamCellIdentifiers:Int {
        
        case durationCell = 0
        case optionsCell
        case propertiesCell
        case count
    }
    
    enum CurveAnimateCellIdentifiers:Int {
        
        case animateCell = 0
        case count
    }
    
    enum SectionIdentifiers:Int {
        
        case curveAnimateSection = 0
        case parameterSection
        case count
        
    }
    var duration = Double(1.0)
    var delay = Double(0.25)


    var xrowHeights = [CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellIdentifiers = [ "CurveAnimationCell", "DurationCellId", "OptionsCellId", "PropertiesCellId"]
        
        sectionHeaderTitles = ["Curve Animation", "Parameters"]
        
        identifierBaseIdx = [0,
                             CurveAnimateCellIdentifiers.count.rawValue]
        
        sectionCount = [CurveAnimateCellIdentifiers.count.rawValue, ParamCellIdentifiers.count.rawValue]

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
    
    
    @IBAction func executeCurveAnimation(_ sender: UIButton) {
        
        let cell = sender.superview?.superview as! CurveAnimationCell
        
        let hex = String(format: "%x", CurveOptionsController.curveOptions.rawValue)
        
        print("Options for animate are \(hex)")
        
        cell.executeAnimation(withDuration: duration, andDelay: delay, animationOptions: CurveOptionsController.curveOptions)
        
    }


}
