//
//  AffineController.swift
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

class AffineController: UITableViewController {
    
    enum RotationCellIdentifiers:Int {
        case rotationCell = 0
        case count
    }
    
    enum SectionIdentifiers:Int {
        case rotationSection = 0
        case count
    }
    
    
    let cellIdentifiers: [String] = ["rotateAffineId"]
    var sectionHeaderTitles: [String] = ["Movement", "Size", "Color", "Transform"]
    var identifierBaseIdx: [Int] = [0]
    var sectionRowCount: [Int] = [RotationCellIdentifiers.count.rawValue]
    var rowHeights: [CGFloat] = Array(repeating: CGFloat(0), count: 1)

    var animationProperties:PropertiesModel? = nil
    
    var degreesRotated = Float(0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        degreesRotated = animationProperties!.degrees
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return SectionIdentifiers.count.rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        guard section < SectionIdentifiers.count.rawValue  else {
            return 0
        }
        return sectionRowCount[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard indexPath.section < SectionIdentifiers.count.rawValue && (identifierBaseIdx[indexPath.section] + indexPath.row) < cellIdentifiers.count else {
            fatalError("Invalid indexpath in affineController.")
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers[identifierBaseIdx[indexPath.section]+indexPath.row], for: indexPath)

        // Configure the cell...

        return cell
    }


    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
                
        guard let section = SectionIdentifiers(rawValue: indexPath.section) else {
            fatalError("Invalid section in AffineController")
        }
        
        switch section {
        case .rotationSection:
            guard let rowId = RotationCellIdentifiers(rawValue: indexPath.row) else {
                fatalError("Invalid row in rotation section of AffineController")
            }
            if rowId == .rotationCell {
                guard let rotateCell = cell as? RotateAffineCell else {
                    fatalError("Invalid rotate cell in AffineController")
                }
                rotateCell.degrees = degreesRotated
            }

        default:
            fatalError("Invalid Section in AffineController")
        }
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let section = SectionIdentifiers(rawValue: indexPath.section) else {
            fatalError("Invalid section in AffineController")
        }
        
        switch section {
        case .rotationSection:
            guard let rowId = RotationCellIdentifiers(rawValue: indexPath.row) else {
                fatalError("Invalid row in rotation section of AffineController")
            }
            if rowId == .rotationCell {
                guard let rotateCell = cell as? RotateAffineCell else {
                    fatalError("Invalid rotate cell in AffineController")
                }
                degreesRotated = rotateCell.degrees
            }
            
        default:
            fatalError("Invalid Section in AffineController")
        }

    }
 
    // MARK: - Navigation

    @IBAction func done(_ sender: UIBarButtonItem) {
        
        guard let cell = tableView.cellForRow(at: IndexPath(row: RotationCellIdentifiers.rotationCell.rawValue, section: SectionIdentifiers.rotationSection.rawValue)) as? RotateAffineCell else {
            fatalError("No such cell in Affine Controlelr")
        }
        
        animationProperties!.degrees = cell.degrees
        
        navigationController?.popViewController(animated: true)
        
    }

}
