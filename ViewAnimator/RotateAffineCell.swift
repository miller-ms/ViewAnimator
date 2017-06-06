//
//  RotateAffineCell.swift
//  ViewAnimator
//
//  Created by William Miller DBA Miller Mobilesoft on 5/29/17.
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

class RotateAffineCell: UITableViewCell {

    // MARK: - controlls
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var degreesLbl: UILabel!
    @IBOutlet weak var imageObj: UIImageView!
    
    var maximumFractionDigits = 0
    var minimumFractionDigits = 0
    var maximumIntegerDigits = 3
    var minimumIntegerDigits = 1

    var degrees = Float(0.0) {
        didSet {
            
            guard (degreesLbl != nil) && (slider != nil) && (imageObj != nil) else {
                return
            }
            
            let formatter = NumberFormatter()
            
            formatter.numberStyle = .decimal
            
            formatter.maximumFractionDigits = maximumFractionDigits
            
            formatter.minimumFractionDigits = minimumFractionDigits
            
            formatter.maximumIntegerDigits = maximumIntegerDigits
            
            formatter.minimumIntegerDigits = minimumIntegerDigits
            
            degreesLbl.text = formatter.string(from: NSNumber(value: degrees))!
            
            slider.value = degrees
            
            imageObj.transform = CGAffineTransform(rotationAngle: CGFloat(slider.value * Float.pi / 180))
            
            print("Didset degrees \(degrees)")
            
        }
    }
    
    var radians: Float {
        get {
            return degrees * Float.pi / 180
        }
        
        set {
            degrees = newValue * 180 / Float.pi
        }
    }
    
    var affine: CGAffineTransform {
        return CGAffineTransform(rotationAngle: CGFloat(degrees * Float.pi / 180))
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK: - Action Methods

    @IBAction func degreesChanged(_ sender: UISlider) {
        
        degrees = sender.value
        
    }
}
