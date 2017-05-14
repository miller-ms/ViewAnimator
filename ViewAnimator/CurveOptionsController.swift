//
//  OptionsController.swift
//  ViewAnimator
//
//  Created by William Miller on 5/7/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
//

import UIKit




class CurveOptionsController: AnimationOptionsController {

    static var curveOptions:UIViewAnimationOptions = [UIViewAnimationOptions.curveEaseInOut]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newOptions = CurveOptionsController.curveOptions

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
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
        
    }

    @IBAction func done(_ sender: UIBarButtonItem) {
        
        CurveOptionsController.curveOptions = newOptions
        
        navigationController?.popViewController(animated: true)
                
    }
    

}
