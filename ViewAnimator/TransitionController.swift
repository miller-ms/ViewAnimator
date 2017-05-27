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
    
    var options = OptionsModel(options: [UIViewAnimationOptions.transitionCrossDissolve])

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
    
    func transferParametersFromCells()  {
        let parameterPath = IndexPath(row:ParamCellIdentifiers.durationCell.rawValue, section: SectionIdentifiers.parameterSection.rawValue)
        
        let cell = tableView.cellForRow(at: parameterPath) as? FloatValueCell
        
        if cell != nil {
            duration = Double(cell!.value)
        }

    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let propertySection =  SectionIdentifiers(rawValue: indexPath.section) else {
            fatalError("invalid section in properties controller")
        }
        
        switch propertySection {
        case .parameterSection:
            guard let paramCellId = ParamCellIdentifiers(rawValue: indexPath.row) else {
                fatalError("Invalid row in parameter section")
            }
            
            if paramCellId == .durationCell {
                let paramCell = cell as! FloatValueCell
                paramCell.value = Float(duration)
            }

        default:
            break
        }

    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let propertySection =  SectionIdentifiers(rawValue: indexPath.section) else {
            fatalError("invalid section in properties controller")
        }
        
        switch propertySection {
        case .parameterSection:
            guard let paramCellId = ParamCellIdentifiers(rawValue: indexPath.row) else {
                fatalError("Invalid row in parameter section")
            }
            
            if paramCellId == .durationCell {
                let paramCell = cell as! FloatValueCell
                duration = Double(paramCell.value)
            }
            
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
        let optionsController = segue.destination as! TransitionOptionsController
        
        optionsController.options = options
    }
    
    @IBAction func durationChanged(_ sender: UISlider) {
        
        let cell = sender.superview!.superview as! FloatValueCell
        
        duration = Double(cell.value)
        
    }
    
    @IBAction func executeTransition(_ sender: UIButton) {
        
        let cell = sender.superview?.superview as! TransitionCell
        
        var hex = String(format: "%x", options.animationOptions.rawValue)
        
        print("Options for animate are \(hex)")

        hex = String(format: "%x", UIViewAnimationOptions.transitionCrossDissolve.rawValue)

        print("crosse dissolve value is \(hex)")
        
        transferParametersFromCells()
        
        cell.executeTransition(withDuration: duration, animationOptions: options.animationOptions)
        
    }

}
