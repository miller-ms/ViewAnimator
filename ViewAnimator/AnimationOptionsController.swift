//
//  OptionsController.swift
//  ViewAnimator
//
//  Created by William Miller on 5/7/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
//

import UIKit




class AnimationOptionsController: UITableViewController {
        
    var newOptions:UIViewAnimationOptions = []
    
//    enum OptionCellIds:String {
//        
//        case repeatId = "repeat"
//        case autoReverseId = "autoReverse"
//        case curveEaseInOutId = "curveEaseInOut"
//        case curveEaseInId = "curveEaseIn"
//        case curveEaseOutId = "curveEaseOut"
//        case curveLinearId = "curveLinear"
//        case transitionFlipFromLeftId = "transitionFlipFromLeft"
//        case transitionFlipFromRightId = "transitionFlipFromRight"
//        case transitionCurlUpId = "transitionCurlUp"
//        case transitionCurlDownId = "transitionCurlDown"
//        case transitionCrossDissolveId = "transitionCrossDissolve"
//        case transitionFlipFromTopId = "transitionFlipFromTop"
//        case transitionFlipFromBottomId = "transitionFlipFromBottom"
//        case preferredFramesPerSecond30Id = "preferredFramesPerSecond30"
//        case preferredFramesPerSecond60Id = "preferredFramesPerSecond60"
//        
//    }
    
//    enum OptionSections:Int {
//        case optionsSection = 0
//        case curveSection
//        case transitionSection
//        case preferredSection
//        case count
//    }
//    
//    enum OptionsRows:Int {
//        
//        case repeatRow = 0
//        case autoReverseRow
//        case count
//    }
//    
//    enum CurveRows:Int {
//        case curveEaseInOutRow = 0
//        case curveEaseInRow
//        case curveEaseOutRow
//        case curveLinearRow
//        case count
//    }
//    
//    enum TransitionRows:Int {
//        case transitionFlipFromLeft = 0
//        case transitionFlipFromRight
//        case transitonCurlUp
//        case transitionCurlDown
//        case transitonCrossDissolve
//        case transitionFlipFromTop
//        case transitionFlipFromBottom
//        case count
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = true

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
        // #warning Incomplete implementation, return the number of sections
        return super.numberOfSections(in: tableView)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return super.tableView(tableView, numberOfRowsInSection: section)
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    // MARK: - Cell Notifications
 
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cellWithOption = cell as! OptionCell
        
        switch cellWithOption.cellId() {
        case .autoReverseId:
            if newOptions.contains(.autoreverse) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .repeatId:
            if newOptions.contains(.repeat) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }

        case .curveLinearId:
            if newOptions.contains(.curveLinear) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }

        case .curveEaseOutId:
            
            if newOptions.contains(.curveLinear) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.curveEaseOut) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }

        case .curveEaseInId:
            
            if newOptions.contains(.curveLinear) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.curveEaseOut) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.curveEaseIn) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .curveEaseInOutId:
            if newOptions.contains(.curveLinear) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.curveEaseOut) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.curveEaseIn) {
                cellWithOption.isOn = false
            } else {
                cellWithOption.isOn = true
            }
            
        case .transitionFlipFromBottomId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .transitionFlipFromTopId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromTop) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }

        case .transitionCrossDissolveId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromTop) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionCrossDissolve) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .transitionCurlDownId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromTop) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionCrossDissolve) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionCurlDown) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .transitionCurlUpId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromTop) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionCrossDissolve) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionCurlDown) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionCurlUp) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .transitionFlipFromRightId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromTop) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionCrossDissolve) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionCurlDown) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionCurlUp) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromRight) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .transitionFlipFromLeftId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromTop) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionCrossDissolve) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionCurlDown) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionCurlUp) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromRight) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromLeft) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .preferredFramesPerSecond30Id:
            if newOptions.contains(.preferredFramesPerSecond30) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
        
        
        case .preferredFramesPerSecond60Id:
            if newOptions.contains(.preferredFramesPerSecond30) {
                cellWithOption.isOn = false
            } else if newOptions.contains(.preferredFramesPerSecond60) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .unknownId:
            print ("Option cell presented that's not in the enumeration.")
            
        }

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let cellWithOption = tableView.cellForRow(at: indexPath) as! OptionCell
        
        switch cellWithOption.cellId() {
            
        case .autoReverseId:
            if cellWithOption.isOff {
                newOptions.formUnion(.autoreverse)
            } else {
                newOptions.remove(.autoreverse)
            }
            
        case .repeatId:
            if cellWithOption.isOff {
                newOptions.formUnion(.repeat)
            } else {
                newOptions.remove(.repeat)
            }
            
        case .curveLinearId:
            if cellWithOption.isOff{
                newOptions.remove(.curveLinear)
                newOptions.insert(.curveLinear)
            } else {
                newOptions.remove(.curveLinear)
            }
            
        case .curveEaseOutId:
            if cellWithOption.isOff{
                newOptions.remove(.curveLinear)
                newOptions.insert(.curveEaseOut)
            } else {
                newOptions.remove(.curveLinear)
            }
           
        case .curveEaseInId:
            if cellWithOption.isOff{
                newOptions.remove(.curveLinear)
                newOptions.insert(.curveEaseIn)
            } else {
                newOptions.remove(.curveLinear)
            }
            
        case .curveEaseInOutId:
            if cellWithOption.isOff{
                newOptions.remove(.curveLinear)
                newOptions.insert(.curveEaseInOut)
            } else {
                newOptions.remove(.curveLinear)
            }
            
        case .transitionFlipFromBottomId:
            if cellWithOption.isOff{
                newOptions.remove(.transitionFlipFromBottom)
                newOptions.insert(.transitionFlipFromBottom)
            } else {
                newOptions.remove(.transitionFlipFromBottom)
            }
            
        case .transitionFlipFromTopId:
            if cellWithOption.isOff{
                newOptions.remove(.transitionFlipFromBottom)
                newOptions.insert(.transitionFlipFromTop)
            } else {
                newOptions.remove(.transitionFlipFromTop)
            }
            
        case .transitionCrossDissolveId:
            if cellWithOption.isOff{
                newOptions.remove(.transitionFlipFromBottom)
                newOptions.insert(.transitionCrossDissolve)
            } else {
                newOptions.remove(.transitionCrossDissolve)
            }
            
        case .transitionCurlDownId:
            if cellWithOption.isOff{
                newOptions.remove(.transitionFlipFromBottom)
                newOptions.insert(.transitionCurlDown)
            } else {
                newOptions.remove(.transitionCurlDown)
            }
            
        case .transitionCurlUpId:
            if cellWithOption.isOff{
                newOptions.remove(.transitionFlipFromBottom)
                newOptions.insert(.transitionCurlUp)
            } else {
                newOptions.remove(.transitionCurlUp)
            }
            
        case .transitionFlipFromRightId:
            if cellWithOption.isOff{
                newOptions.remove(.transitionFlipFromBottom)
                newOptions.insert(.transitionFlipFromRight)
            } else {
                newOptions.remove(.transitionFlipFromRight)
            }
            
        case .transitionFlipFromLeftId:
            if cellWithOption.isOff{
                newOptions.remove(.transitionFlipFromBottom)
                newOptions.insert(.transitionFlipFromLeft)
            } else {
                newOptions.remove(.transitionFlipFromLeft)
            }
            
        case .preferredFramesPerSecond30Id:
            if cellWithOption.isOff{
                newOptions.remove(.preferredFramesPerSecond30)
                newOptions.insert(.preferredFramesPerSecond30)
            } else {
                newOptions.remove(.transitionFlipFromBottom)
            }
            
            
        case .preferredFramesPerSecond60Id:
            if cellWithOption.isOff{
                newOptions.remove(.preferredFramesPerSecond30)
                newOptions.insert(.preferredFramesPerSecond60)
            } else {
                newOptions.remove(.preferredFramesPerSecond60)
            }

            
        case .unknownId:
            print ("Option cell presented that's not in the enumeration.")
            return
            

        }
        cellWithOption.isSelected = false
        tableView.reloadData()

        
    }
    
}
