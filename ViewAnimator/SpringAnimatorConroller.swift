//
//  SpringAnimatorConroller.swift
//  ViewAnimator
//
//  Created by William Miller DBA Miller Mobilesoft on 5/13/17.
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
    var springDamping = CGFloat(0.5)
    var velocity = CGFloat(0.5)
    var animationProperties = PropertiesModel()
    var options = OptionsModel(options: [UIViewAnimationOptions.curveEaseInOut])

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
    
    func saveParameters () {
        
        var parameterPath = IndexPath(row:ParamCellIdentifiers.durationCell.rawValue, section: SectionIdentifiers.parameterSection.rawValue)
        
        var cell = tableView.cellForRow(at: parameterPath) as? FloatValueCell
        
        if cell != nil {
            duration = Double(cell!.value)
        }
        
        parameterPath = IndexPath(row:ParamCellIdentifiers.delayCell.rawValue, section: SectionIdentifiers.parameterSection.rawValue)
        
        cell = tableView.cellForRow(at: parameterPath) as? FloatValueCell
        
        if cell != nil {
            delay = Double(cell!.value)
        }

        parameterPath = IndexPath(row:ParamCellIdentifiers.springDampingCell.rawValue, section: SectionIdentifiers.parameterSection.rawValue)
        
        cell = tableView.cellForRow(at: parameterPath) as? FloatValueCell
        
        if cell != nil {
            springDamping = CGFloat(cell!.value)
        }
        
        parameterPath = IndexPath(row:ParamCellIdentifiers.velocityCell.rawValue, section: SectionIdentifiers.parameterSection.rawValue)
        
        cell = tableView.cellForRow(at: parameterPath) as? FloatValueCell
        
        if cell != nil {
            velocity = CGFloat(cell!.value)
        }

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let section = SectionIdentifiers(rawValue: indexPath.section) else {
            return
        }
        
        let cell = tableView.cellForRow(at: indexPath)!
        
        cell.isSelected = false
        
        switch section {
        case .animateSection:
            let curveCell = cell as! SpringAnimationCell
            curveCell.reset()
        default:
            break
        }
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is PropertiesController {
            
            let propertiesVC = segue.destination as! PropertiesController
            
            propertiesVC.animationProperties = animationProperties
        } else if segue.destination is SpringOptionsController {
            
            let optionsVC = segue.destination as! SpringOptionsController
            optionsVC.options = options
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
    @IBAction func springDampingChanged(_ sender: UISlider) {
        
        
        let cell = sender.superview!.superview as! FloatValueCell
        
        springDamping = CGFloat(cell.value)        
    }
    
    @IBAction func springVelocityChanged(_ sender: UISlider) {
        
        let cell = sender.superview!.superview as! FloatValueCell
        
        velocity = CGFloat(cell.value)

    }
    
    @IBAction func executeSpringAnimation(_ sender: UIButton) {
        
        
        let cell = sender.superview?.superview as! SpringAnimationCell
        
        let hex = String(format: "%x", options.animationOptions.rawValue) // SpringOptionsController.springOptions.rawValue)
        
        print("Options for animate are \(hex)")
        
        saveParameters()
        
        cell.executeAnimation(withDuration: duration, andDelay: delay, usingSpringwithDamping: springDamping, withInitialSpringVelocity: velocity, animationOptions: options.animationOptions, animationProperties: animationProperties)
        
    }
    
    
}
