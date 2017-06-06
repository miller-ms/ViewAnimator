//
//  AnimatorController.swift
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

class AnimatorController: UITableViewController {
    
    var cellIdentifiers: [String] = []
    
    var sectionHeaderTitles: [String] = []
    
    var identifierBaseIdx: [Int] = []
    
    var sectionCount: [Int] = []
    
    var rowHeights: [CGFloat] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        

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
