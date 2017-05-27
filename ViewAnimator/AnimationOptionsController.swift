//
//  OptionsController.swift
//  ViewAnimator
//
//  Created by William Miller on 5/7/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
//

import UIKit




class AnimationOptionsController: UITableViewController {
        
    var newOptions = OptionsModel(options: [])
    
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
            if newOptions.animationOptions.contains(.autoreverse) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .repeatId:
            if newOptions.animationOptions.contains(.repeat) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }

        case .curveLinearId:
            if newOptions.animationOptions.contains(.curveLinear) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }

        case .curveEaseOutId:
            
            if newOptions.animationOptions.contains(.curveLinear) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.curveEaseOut) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }

        case .curveEaseInId:
            
            if newOptions.animationOptions.contains(.curveLinear) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.curveEaseOut) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.curveEaseIn) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .curveEaseInOutId:
            if newOptions.animationOptions.contains(.curveLinear) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.curveEaseOut) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.curveEaseIn) {
                cellWithOption.isOn = false
            } else {
                cellWithOption.isOn = true
            }
            
        case .transitionFlipFromBottomId:
            if newOptions.animationOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .transitionFlipFromTopId:
            if newOptions.animationOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionFlipFromTop) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }

        case .transitionCrossDissolveId:
            if newOptions.animationOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionFlipFromTop) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionCrossDissolve) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .transitionCurlDownId:
            if newOptions.animationOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionFlipFromTop) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionCrossDissolve) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionCurlDown) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .transitionCurlUpId:
            if newOptions.animationOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionFlipFromTop) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionCrossDissolve) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionCurlDown) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionCurlUp) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .transitionFlipFromRightId:
            if newOptions.animationOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionFlipFromTop) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionCrossDissolve) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionCurlDown) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionCurlUp) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionFlipFromRight) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .transitionFlipFromLeftId:
            if newOptions.animationOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionFlipFromTop) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionCrossDissolve) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionCurlDown) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionCurlUp) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionFlipFromRight) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.transitionFlipFromLeft) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        case .preferredFramesPerSecond30Id:
            if newOptions.animationOptions.contains(.preferredFramesPerSecond30) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
        
        
        case .preferredFramesPerSecond60Id:
            if newOptions.animationOptions.contains(.preferredFramesPerSecond30) {
                cellWithOption.isOn = false
            } else if newOptions.animationOptions.contains(.preferredFramesPerSecond60) {
                cellWithOption.isOn = true
            } else {
                cellWithOption.isOn = false
            }
            
        }

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let cellWithOption = tableView.cellForRow(at: indexPath) as! OptionCell
        
        switch cellWithOption.cellId() {
            
        case .autoReverseId:
            if cellWithOption.isOff {
                newOptions.animationOptions.formUnion(.autoreverse)
                newOptions.animationOptions.formUnion(.repeat)

            } else {
                newOptions.animationOptions.remove(.autoreverse)
            }
            
        case .repeatId:
            if cellWithOption.isOff {
                newOptions.animationOptions.formUnion(.repeat)
            } else {
                newOptions.animationOptions.remove(.repeat)
                newOptions.animationOptions.remove(.autoreverse)

            }
            
        case .curveLinearId:
            if cellWithOption.isOff{
                newOptions.animationOptions.remove(.curveLinear)
                newOptions.animationOptions.insert(.curveLinear)
            }
            
        case .curveEaseOutId:
            if cellWithOption.isOff{
                newOptions.animationOptions.remove(.curveLinear)
                newOptions.animationOptions.insert(.curveEaseOut)
            }
           
        case .curveEaseInId:
            if cellWithOption.isOff{
                newOptions.animationOptions.remove(.curveLinear)
                newOptions.animationOptions.insert(.curveEaseIn)
            }
            
        case .curveEaseInOutId:
            if cellWithOption.isOff{
                newOptions.animationOptions.remove(.curveLinear)
                newOptions.animationOptions.insert(.curveEaseInOut)
            }
            
        case .transitionFlipFromBottomId:
            if cellWithOption.isOff{
                newOptions.animationOptions.remove(.transitionFlipFromBottom)
                newOptions.animationOptions.insert(.transitionFlipFromBottom)
            }
            
        case .transitionFlipFromTopId:
            if cellWithOption.isOff{
                newOptions.animationOptions.remove(.transitionFlipFromBottom)
                newOptions.animationOptions.insert(.transitionFlipFromTop)
            }
            
        case .transitionCrossDissolveId:
            if cellWithOption.isOff{
                newOptions.animationOptions.remove(.transitionFlipFromBottom)
                newOptions.animationOptions.insert(.transitionCrossDissolve)
            }
            
        case .transitionCurlDownId:
            if cellWithOption.isOff{
                newOptions.animationOptions.remove(.transitionFlipFromBottom)
                newOptions.animationOptions.insert(.transitionCurlDown)
            }
            
        case .transitionCurlUpId:
            if cellWithOption.isOff{
                newOptions.animationOptions.remove(.transitionFlipFromBottom)
                newOptions.animationOptions.insert(.transitionCurlUp)
            }

        case .transitionFlipFromRightId:
            if cellWithOption.isOff{
                newOptions.animationOptions.remove(.transitionFlipFromBottom)
                newOptions.animationOptions.insert(.transitionFlipFromRight)
            }
            
        case .transitionFlipFromLeftId:
            if cellWithOption.isOff{
                newOptions.animationOptions.remove(.transitionFlipFromBottom)
                newOptions.animationOptions.insert(.transitionFlipFromLeft)
            }
            
        case .preferredFramesPerSecond30Id:
            if cellWithOption.isOff{
                newOptions.animationOptions.remove(.preferredFramesPerSecond60)
                newOptions.animationOptions.insert(.preferredFramesPerSecond30)
            } else {
                newOptions.animationOptions.remove(.preferredFramesPerSecond30)
            }
            
        case .preferredFramesPerSecond60Id:
            if cellWithOption.isOff{
                newOptions.animationOptions.remove(.preferredFramesPerSecond30)
                newOptions.animationOptions.insert(.preferredFramesPerSecond60)
            } else {
                newOptions.animationOptions.remove(.preferredFramesPerSecond60)
            }

        }
        cellWithOption.isSelected = false
        tableView.reloadData()

        
    }
    
}
