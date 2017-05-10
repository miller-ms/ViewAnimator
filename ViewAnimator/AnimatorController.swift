//
//  AnimatorController.swift
//  ViewAnimator
//
//  Created by William Miller on 5/3/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
//

import UIKit


enum ParamCellIdentifiers:Int {
    
    case durationCell = 0
    case delayCell
    case springDampingCell
    case velocityCell
    case optionsCell
    case propertiesCell
    case count
}

enum AnimateCellIdentifiers:Int {
    
    case animateCell = 0
    case count
}

enum SectionIdentifiers:Int {
    
    case parameterSection = 0
    case animateSection
    case count
    
}

var rowHeights = [CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0)]

let cellIdentifiers = [ "DurationCellId", "DelayCellId", "SpringDampingCellId", "SpringVelocityCellId", "OptionsCellId", "PropertiesCellId", "AnimationCell"]

let sectionHeaderTitles = ["Parameters", "Animation"]

let identifierBaseIdx = [0, ParamCellIdentifiers.count.rawValue]

let sectionCount = [ParamCellIdentifiers.count.rawValue, AnimateCellIdentifiers.count.rawValue]

class AnimatorController: UITableViewController {
    
    var duration = Double(1.0)
    var delay = Double(0.25)
    var sprintDamping = CGFloat(0.5)
    var velocity = CGFloat(0.5)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsetsMake(UIApplication.shared.statusBarFrame.height, 0, 0, 0)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        print ("Section Count = \(SectionIdentifiers.count.rawValue)")

        return SectionIdentifiers.count.rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("Row Count = \(sectionCount[section])")
        
        return sectionCount[section]
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseIdentifier = cellIdentifiers[identifierBaseIdx[indexPath.section] + indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)!
        
        rowHeights[indexPath.row] = cell.bounds.height
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionHeaderTitles[section]
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeights[indexPath.row]
    }
    
//    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        
//        print("accessoryButton Pressed")
//        
//        
//        if indexPath.row == ParamCellIdentifiers.optionsCell.rawValue {
//            
//            performSegue(withIdentifier: "OptionsSegueId", sender: self)
//            
//        }
//        
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

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
    
    @IBAction func executeAnimation(_ sender: UIButton) {
        

        let cell = sender.superview?.superview as! AnimationCell
        
        let hex = String(format: "%x", OptionsController.currentOptions.rawValue)
        
        print("Options for animate are \(hex)")
        
        cell.executeAnimation(withDuration: duration, andDelay: delay, usingSpringwithDamping: sprintDamping, withInitialSpringVelocity: velocity, animationOptions: OptionsController.currentOptions)
                
    }
}
