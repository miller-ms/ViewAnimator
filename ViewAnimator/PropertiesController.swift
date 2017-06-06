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

class PropertiesController: UITableViewController {
    
    enum MotionCellIdentifiers:Int {
        
        case leftToRightCell = 0
        case rightToLeftCell
        case stillCell
        case count
        
    }
    
    enum SizeCellIdentifiers:Int {
        
        case heightCell = 0
        case widthCell
        case count
        
    }
    
    enum ColorCellIdentifiers:Int {
        
        case startBackgroundColorCell = 0
        case endBackgroundColorCell
        case count
        
    }
    
    enum TransformationIdentifiers:Int {
        
        case transformCell = 0
        case count
        
    }
    
    enum SectionIdentifiers:Int {
        
        case motionSection = 0
        case sizeSection
        case colorSection
        case transformationSection
        case count
        
    }
    
    
    var animationProperties:PropertiesModel? = nil
    
    let cellIdentifiers: [String] = ["leftToRightId", "rightToLeftId", "stillId", "heightId", "widthId", "startBackgroundColorId", "endBackgroundColorId", "transformId"]
    
    var sectionHeaderTitles: [String] = ["Movement", "Size", "Color", "Transform"]
    
    var identifierBaseIdx: [Int] = [0,
                                    MotionCellIdentifiers.count.rawValue,
                                    MotionCellIdentifiers.count.rawValue+SizeCellIdentifiers.count.rawValue,
                                    MotionCellIdentifiers.count.rawValue+SizeCellIdentifiers.count.rawValue+ColorCellIdentifiers.count.rawValue]
    
    var sectionCount: [Int] = [MotionCellIdentifiers.count.rawValue,
                               SizeCellIdentifiers.count.rawValue,
                               ColorCellIdentifiers.count.rawValue,
                               TransformationIdentifiers.count.rawValue]
    
    var rowHeights: [CGFloat] = Array(repeating: CGFloat(0), count: 8)
    
    var inSelectStartColor = true

    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        
        return;
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) else {
            fatalError("Invalid indexpath \(indexPath) in properties controller ")
        }
            
        cell.isSelected = false
        
        guard let section = SectionIdentifiers(rawValue:indexPath.section) else {
            fatalError("invalid section in properties controller")
        }
        
        switch section {
        case .motionSection:
            let uncheckIndexPath = IndexPath(row: animationProperties!.animationVector.rawValue, section: MotionCellIdentifiers.leftToRightCell.rawValue)

            if uncheckIndexPath != indexPath {
                animationProperties?.animationVector = AnimationDirection(rawValue: indexPath.row)!
                var cell = tableView.cellForRow(at: uncheckIndexPath)
                cell!.accessoryType = .none
                cell = tableView.cellForRow(at: indexPath)
                cell!.accessoryType = .checkmark
            }
        case .colorSection:
            guard let rowId = ColorCellIdentifiers(rawValue: indexPath.row) else {
                fatalError("Invalid row in color section of properties controller")
            }
            
            guard let colorCell = (cell as? ColorCell) else {
                
                fatalError("Invalid colorCell in color section of properties controller")
   
            }
            
            if rowId == .endBackgroundColorCell {
                
                animationProperties!.endBackgroundAlpha = Float(colorCell.alphaProperty)
                
            } else if rowId == .startBackgroundColorCell {
                animationProperties!.startBackgroundAlpha = Float(colorCell.alphaProperty)

            } else {
                fatalError("Invalid cellId in color section of properties controller")
            }
            
            
        default:
            break
        }
        
    }
    
    func transferPropertiesFromCells () {
        
        let endPath = IndexPath(row: ColorCellIdentifiers.endBackgroundColorCell.rawValue, section: SectionIdentifiers.colorSection.rawValue)
        var cell = tableView.cellForRow(at: endPath) as? ColorCell
        if cell != nil {
            animationProperties!.endBackgroundAlpha = Float(cell!.alphaProperty)
            animationProperties!.endBackgroundColor = cell!.colorProperty
        }
        
        let startPath = IndexPath(row: ColorCellIdentifiers.startBackgroundColorCell.rawValue, section: SectionIdentifiers.colorSection.rawValue)
        cell = tableView.cellForRow(at: startPath) as? ColorCell
        if cell != nil {
            animationProperties!.startBackgroundAlpha = Float(cell!.alphaProperty)
            animationProperties!.startBackgroundColor = cell!.colorProperty
        }
        
        var sizePath = IndexPath(row: SizeCellIdentifiers.heightCell.rawValue, section: SectionIdentifiers.sizeSection.rawValue)
        var sizeCell = tableView.cellForRow(at: sizePath) as? FloatValueCell
        if sizeCell != nil {
            animationProperties!.heightMultiplier =  sizeCell!.value
        }
        
        sizePath = IndexPath(row: SizeCellIdentifiers.widthCell.rawValue, section: SectionIdentifiers.sizeSection.rawValue)
        sizeCell = tableView.cellForRow(at: sizePath) as? FloatValueCell
        if sizeCell != nil {
            animationProperties!.widthMultiplier =  sizeCell!.value
        }
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let propertySection =  SectionIdentifiers(rawValue: indexPath.section) else {
            fatalError("invalid section in properties controller")
        }
        
        switch propertySection {
        case .motionSection:
            
            guard let directionCell = MotionCellIdentifiers(rawValue: indexPath.row) else {
                fatalError("Invalid row in motion section")
            }
            
            switch  directionCell {
            case .leftToRightCell:
                if animationProperties!.animationVector == .leftToRight {
                    cell.accessoryType = .checkmark
                }
            case .rightToLeftCell:
                if animationProperties!.animationVector == .rightToLeft {
                    cell.accessoryType = .checkmark
                }
            case .stillCell:
                if animationProperties!.animationVector == .still {
                    cell.accessoryType = .checkmark
                }
            default:
                fatalError("Invalid row in motion section")
                break
            }
            
        case .colorSection:
            
            guard let colorCellId = ColorCellIdentifiers(rawValue: indexPath.row) else {
                fatalError("Invalid row in color section")
            }
            let colorCell = cell as! ColorCell
            
            switch colorCellId {
            case .endBackgroundColorCell:
                colorCell.alphaProperty = CGFloat(animationProperties!.endBackgroundAlpha)
                colorCell.colorProperty = animationProperties!.endBackgroundColor

            case .startBackgroundColorCell:
                colorCell.alphaProperty = CGFloat(animationProperties!.startBackgroundAlpha)
                colorCell.colorProperty = animationProperties!.startBackgroundColor

            default:
                fatalError("Invalid row in color section")

            }
            
            
        case .sizeSection:
            guard let sizeCellId = SizeCellIdentifiers(rawValue: indexPath.row) else {
                fatalError("Invalid row in size section")
            }
            let sizeCell = cell as! FloatValueCell
            
            switch sizeCellId {
            case .heightCell:
                sizeCell.value = animationProperties!.heightMultiplier
            case .widthCell:
                sizeCell.value = animationProperties!.widthMultiplier
                
            default:
                fatalError("Invalid row in size section")
                
            }

        case .transformationSection:
            break
        default:
            break
        }
    }

    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let propertySection =  SectionIdentifiers(rawValue: indexPath.section) else {
            fatalError("invalid section in properties controller")
        }
        
        switch propertySection {
        case .motionSection:
            
            guard let directionCell = MotionCellIdentifiers(rawValue: indexPath.row) else {
                fatalError("Invalid row in motion section")
            }
            
            switch  directionCell {
            case .leftToRightCell:
                if cell.accessoryType == .checkmark {
                    animationProperties!.animationVector = .leftToRight
                }
            case .rightToLeftCell:
                
                if cell.accessoryType == .checkmark {
                    animationProperties!.animationVector = .rightToLeft
                }
            case .stillCell:
                if cell.accessoryType == .checkmark {
                    animationProperties!.animationVector = .still
                }
            default:
                fatalError("Invalid row in motion section")
                break
            }
            
        case .colorSection:
            
            guard let colorCellId = ColorCellIdentifiers(rawValue: indexPath.row) else {
                fatalError("Invalid row in color section")
            }
            let colorCell = cell as! ColorCell
            
            switch colorCellId {
            case .endBackgroundColorCell:
                animationProperties!.endBackgroundAlpha = Float(colorCell.alphaProperty)
                animationProperties!.endBackgroundColor = colorCell.colorProperty
            case .startBackgroundColorCell:
                animationProperties!.startBackgroundAlpha = Float(colorCell.alphaProperty)
                animationProperties!.startBackgroundColor = colorCell.colorProperty
            default:
                fatalError("Invalid row in color section")
                
            }
            
            
        case .sizeSection:
            guard let sizeCellId = SizeCellIdentifiers(rawValue: indexPath.row) else {
                fatalError("Invalid row in size section")
            }
            let sizeCell = cell as! FloatValueCell
            
            switch sizeCellId {
            case .heightCell:
                animationProperties!.heightMultiplier = sizeCell.value
            case .widthCell:
                animationProperties!.widthMultiplier = sizeCell.value
            default:
                fatalError("Invalid row in size section")
            }
        case .transformationSection:
            break
        default:
            break
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return sectionCount.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
                
        rowHeights[identifierBaseIdx[indexPath.section]+indexPath.row] = cell.bounds.height
        print("in cellforrowat \(indexPath) rowHeight \(rowHeights[indexPath.row])")

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
        
        return rowHeights[identifierBaseIdx[indexPath.section]+indexPath.row]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case "startColorSegueId":
            let colorController = segue.destination as! ColorController
            colorController.initialColor = animationProperties!.startBackgroundColor
            inSelectStartColor = true

        case "endColorSegueId":
            let colorController = segue.destination as! ColorController
            colorController.initialColor = animationProperties!.endBackgroundColor
            inSelectStartColor = false
            
        case "affineSegueId":
            let affineController = segue.destination as! AffineController
            affineController.animationProperties = animationProperties
            break
            
        default:
            fatalError("Invalid segue from propertiesContorller")
        }
        
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController!.popViewController(animated: true)

    }
    @IBAction func done(_ sender: UIBarButtonItem) {
        
        transferPropertiesFromCells()
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func cancelSegue(_ segue:UIStoryboardSegue) {
        
        return
        
    }
    
    @IBAction func saveColorSegue(_ segue:UIStoryboardSegue) {
        
        switch inSelectStartColor {
        case true:
            let colorCtl = segue.source as! ColorController
            animationProperties?.startBackgroundColor = colorCtl.color

            let startPath = IndexPath(row: ColorCellIdentifiers.startBackgroundColorCell.rawValue, section: SectionIdentifiers.colorSection.rawValue)
            let cell = tableView.cellForRow(at: startPath)
            if cell != nil {
                tableView(tableView, willDisplay: cell!, forRowAt: startPath)
            }


        case false:
            let colorCtl = segue.source as! ColorController
            animationProperties?.endBackgroundColor = colorCtl.color

            let endPath = IndexPath(row: ColorCellIdentifiers.endBackgroundColorCell.rawValue, section: SectionIdentifiers.colorSection.rawValue)
            let cell = tableView.cellForRow(at: endPath)
            if cell != nil {
                tableView(tableView, willDisplay: cell!, forRowAt: endPath)
            }

        }
        
    }
    
}
