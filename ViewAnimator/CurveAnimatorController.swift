//
//  CurveAnimatorController.swift
//  ViewAnimator
//
//  Created by William Miller DBA Miller Mobilesoft on 5/22/17.
//
//  This application is intended to be a developer tool for evaluating the
//  options for creating an animation or transition using the UIView static
//  methods UIView.animate and UIView.transition.
//  Copyright © 2017 William Miller DBA Miller Mobilesoft
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//  If you would like to reach the developer you may email me at
//  support@millermobilesoft.com or visit my website at
//  http://millermobilesoft.com
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
    var animationProperties = PropertiesModel()
    var options = OptionsModel(options: [UIViewAnimationOptions.curveEaseInOut])

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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let section = SectionIdentifiers(rawValue: indexPath.section) else {
            return
        }
        
        let cell = tableView.cellForRow(at: indexPath)!
        
        cell.isSelected = false
        
        switch section {
        case SectionIdentifiers.curveAnimateSection:
            let curveCell = cell as! CurveAnimationCell
            curveCell.reset()
        default:
            break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "optionsSegue" {
            
            let curveOptionsController = segue.destination as! CurveOptionsController
            
            curveOptionsController.options = options
            
        } else if segue.identifier == "propertiesSegue" {
            
            let propertiesController = segue.destination as! PropertiesController
            
            propertiesController.animationProperties = animationProperties
            
        }
        
    }
    
    @IBAction func durationChanged(_ sender: UISlider) {
                
        let cell = sender.superview!.superview as! FloatValueCell
        
        duration = Double(cell.value)
        
    }
    
    @IBAction func delayChanged(_ sender: UISlider) {
        
                
        let cell = sender.superview?.superview as! FloatValueCell
        
        delay = Double(cell.value)
        
    }
    
    
    @IBAction func executeCurveAnimation(_ sender: UIButton) {
        
        let cell = sender.superview?.superview as! CurveAnimationCell
        
        let hex = String(format: "%x", options.animationOptions.rawValue)
        
        print("Options for animate are \(hex)")
        
        cell.executeAnimation(withDuration: duration, andDelay: delay, animationOptions: options.animationOptions, animationProperties: animationProperties)
        
    }


}
