//
//  OptionsController.swift
//  ViewAnimator
//
//  Created by William Miller on 5/7/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
//

import UIKit




class OptionsController: UITableViewController {
    
    static var currentOptions:UIViewAnimationOptions = [UIViewAnimationOptions.curveEaseInOut]
    
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
    
    enum OptionSections:Int {
        case optionsSection = 0
        case curveSection
        case transitionSection
        case preferredSection
        case count
    }
    
    enum OptionsRows:Int {
        
        case repeatRow = 0
        case autoReverseRow
        case count
    }
    
    enum CurveRows:Int {
        case curveEaseInOutRow = 0
        case curveEaseInRow
        case curveEaseOutRow
        case curveLinearRow
        case count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newOptions = OptionsController.currentOptions

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cellWithOption = cell as! OptionCell
        
        switch cellWithOption.cellId() {
        case .autoReverseId:
            if newOptions.contains(.autoreverse) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }
            
        case .repeatId:
            if newOptions.contains(.repeat) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }

        case .curveLinearId:
            if newOptions.contains(.curveLinear) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }

        case .curveEaseOutId:
            
            if newOptions.contains(.curveLinear) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.curveEaseOut) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }


        case .curveEaseInId:
            
            if newOptions.contains(.curveLinear) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.curveEaseOut) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.curveEaseIn) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }
            

            
        case .curveEaseInOutId:
            if newOptions.contains(.curveLinear) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.curveEaseOut) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.curveEaseIn) {
                cellWithOption.toggleOption.isOn = false
            } else {
                cellWithOption.toggleOption.isOn = true
            }
            
            
        case .transitionFlipFromBottomId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }

            
        case .transitionFlipFromTopId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromTop) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }
            

        case .transitionCrossDissolveId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromTop) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionCrossDissolve) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }

            
        case .transitionCurlDownId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromTop) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionCrossDissolve) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionCurlDown) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }

            
        case .transitionCurlUpId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromTop) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionCrossDissolve) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionCurlDown) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionCurlUp) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }
            
        case .transitionFlipFromRightId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromTop) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionCrossDissolve) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionCurlDown) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionCurlUp) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromRight) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }
            
        case .transitionFlipFromLeftId:
            if newOptions.contains(.transitionFlipFromBottom) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromTop) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionCrossDissolve) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionCurlDown) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionCurlUp) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromRight) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.transitionFlipFromLeft) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }
            
        case .preferredFramesPerSecond30Id:
            if newOptions.contains(.preferredFramesPerSecond30) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }
        
        
        case .preferredFramesPerSecond60Id:
            if newOptions.contains(.preferredFramesPerSecond30) {
                cellWithOption.toggleOption.isOn = false
            } else if newOptions.contains(.preferredFramesPerSecond60) {
                cellWithOption.toggleOption.isOn = true
            } else {
                cellWithOption.toggleOption.isOn = false
            }
            
        case .unknownId:
            print ("Option cell presented that's not in the enumeration.")
            
        }

    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
        
    }

    @IBAction func done(_ sender: UIBarButtonItem) {
        
        OptionsController.currentOptions = newOptions
        
        navigationController?.popViewController(animated: true)
                
    }
    
    @IBAction func setRepeat(_ sender: UISwitch) {
        
        newOptions.formUnion(.repeat)

    }
    @IBAction func setAutoReverse(_ sender: UISwitch) {
        
        
        newOptions.formUnion(.autoreverse)
        
    }
    @IBAction func setCurveEaseInOut(_ sender: UISwitch) {
        
        if sender.isOn {
            
            newOptions.remove(.curveLinear)
            newOptions.insert(.curveEaseInOut)
            
        } else {
            
            newOptions.remove(.curveLinear)
            
        }
        
        tableView.reloadData()
        
        
    }
    @IBAction func setCurveEaseIn(_ sender: UISwitch) {
        
        if sender.isOn {
            
            newOptions.remove(.curveLinear)
            newOptions.insert(.curveEaseIn)
            
        } else {
            
            newOptions.remove(.curveLinear)
            
        }
        
        tableView.reloadData()

    }
    @IBAction func setCurveEaseOut(_ sender: UISwitch) {
        
        if sender.isOn {
            
            newOptions.remove(.curveLinear)
            newOptions.insert(.curveEaseOut)
            
        } else {
            
            newOptions.remove(.curveLinear)
            
        }
        
        
        tableView.reloadData()

        
    }
    @IBAction func setCurveLinear(_ sender: UISwitch) {
        
        if sender.isOn {
            
            newOptions.remove(.curveLinear)
            newOptions.insert(.curveLinear)
            
        } else {
            
            newOptions.remove(.curveLinear)
            
        }
        
        tableView.reloadData()


    }
    @IBAction func setTransitionFlipFromLeft(_ sender: UISwitch) {
        
        if sender.isOn {
            
            newOptions.remove(.transitionFlipFromBottom)
            newOptions.insert(.transitionFlipFromLeft)
            
            
        } else {
            newOptions.remove(.transitionFlipFromLeft)
            
        }
        tableView.reloadData()
        
    }
    @IBAction func setTransitionFlipFromRight(_ sender: UISwitch) {
        
        if sender.isOn {
            
            newOptions.remove(.transitionFlipFromBottom)
            newOptions.insert(.transitionFlipFromRight)
            
            
        } else {
            newOptions.remove(.transitionFlipFromRight)
            
        }
        tableView.reloadData()
        
        
        
    }
    @IBAction func setTransitionCurlUp(_ sender: UISwitch) {
        
        if sender.isOn {
            newOptions.remove(.transitionFlipFromBottom)
            newOptions.insert(.transitionCurlUp)
            
        } else {
            newOptions.remove(.transitionCurlUp)
            
        }
        tableView.reloadData()
        
        
        
    }
    @IBAction func setTransitionCurlDown(_ sender: UISwitch) {
        
        if sender.isOn {
            newOptions.remove(.transitionFlipFromBottom)
            newOptions.insert(.transitionCurlDown)
        } else {
            newOptions.remove(.transitionCurlDown)
        }
        
        tableView.reloadData()
        
        
    }
    @IBAction func setTransitionCrossDissolve(_ sender: UISwitch) {
        
        if sender.isOn {
            newOptions.remove(.transitionFlipFromBottom)
            newOptions.insert(.transitionCrossDissolve)
        } else {
            newOptions.remove(.transitionCrossDissolve)
        }
        
        tableView.reloadData()
        
        
    }
    @IBAction func setTransitionFlipFromTop(_ sender: UISwitch) {
        
        if sender.isOn {
            newOptions.remove(.transitionFlipFromBottom)
            newOptions.insert(.transitionFlipFromTop)
        } else {
            newOptions.remove(.transitionFlipFromTop)
        }
        
        tableView.reloadData()
        
        
    }
    @IBAction func setTransitionFlipFromBotton(_ sender: UISwitch) {
        
        if sender.isOn {
            newOptions.remove(.transitionFlipFromBottom)
            newOptions.insert(.transitionFlipFromBottom)
        } else {
            newOptions.remove(.transitionFlipFromBottom)
        }
        
        tableView.reloadData()
        
        
    }
    @IBAction func setThirtyFramesPerSecond(_ sender: UISwitch) {
        
        if sender.isOn {
            newOptions.remove(.preferredFramesPerSecond30)
            newOptions.insert(.preferredFramesPerSecond30)
        } else {
            newOptions.remove(.transitionFlipFromBottom)
        }
        
        tableView.reloadData()
        
        
    }
    @IBAction func setSixtyFramesPerSecond(_ sender: UISwitch) {
        
        if sender.isOn {
            newOptions.remove(.preferredFramesPerSecond30)
            newOptions.insert(.preferredFramesPerSecond60)
        } else {
            newOptions.remove(.preferredFramesPerSecond60)
        }
        
        tableView.reloadData()
        
        
    }

}
