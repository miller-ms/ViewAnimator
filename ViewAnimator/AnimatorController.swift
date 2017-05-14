//
//  AnimatorController.swift
//  ViewAnimator
//
//  Created by William Miller on 5/3/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
//

import UIKit





class AnimatorController: UITableViewController {
    
    var cellIdentifiers: [String] = []
    
    var sectionHeaderTitles: [String] = []
    
    var identifierBaseIdx: [Int] = []
    
    var sectionCount: [Int] = []
    
    var rowHeights: [CGFloat] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.contentInset = UIEdgeInsetsMake(UIApplication.shared.statusBarFrame.height, 0, 0, 0)
        

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
        
        print ("Section Count = \(sectionCount.count)")

        return sectionCount.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("Row Count = \(sectionCount[section])")
        
        guard section < sectionCount.count else {
            return 0
        }
        
        return sectionCount[section]
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard indexPath.section < identifierBaseIdx.count && (identifierBaseIdx[indexPath.section] + indexPath.row) < cellIdentifiers.count && indexPath.row < rowHeights.count else {
            return super.tableView(tableView, cellForRowAt: indexPath)
        }
        
        let reuseIdentifier = cellIdentifiers[identifierBaseIdx[indexPath.section] + indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)!
        
        rowHeights[indexPath.row] = cell.bounds.height
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        guard section < sectionHeaderTitles.count else {
            return super.tableView(tableView, titleForHeaderInSection: section)
        }
        
        return sectionHeaderTitles[section]
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard indexPath.row < rowHeights.count else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
        
        return rowHeights[indexPath.row]
    }
    
    
    
}
