//
//  AffineController.swift
//  ViewAnimator
//
//  Created by William Miller on 5/29/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
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
