//
//  FloatValueCell.swift
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

class FloatValueCell: UITableViewCell {

    @IBOutlet weak var floatLabel: UILabel!
    @IBOutlet weak var floatSlider: UISlider!
    @IBOutlet weak var floatValue: UILabel!
    
    var maximumFractionDigits = 2
    var minimumFractionDigits = 2
    var maximumIntegerDigits = 2
    var minimumIntegerDigits = 1
    var withSuffix = false
    
    var value = Float(0.0) {
        didSet {
            
            guard (floatLabel != nil) && (floatSlider != nil) else {
                return
            }
            
            let formatter = NumberFormatter()
            
            formatter.numberStyle = .decimal
            
            formatter.maximumFractionDigits = maximumFractionDigits
            
            formatter.minimumFractionDigits = minimumFractionDigits
            
            formatter.maximumIntegerDigits = maximumIntegerDigits
            
            formatter.minimumIntegerDigits = minimumIntegerDigits
            
            floatValue.text = formatter.string(from: NSNumber(value: value))!
            
            if withSuffix {
                floatValue.text = floatValue.text!  + "x"
            }
            
            floatSlider.value = value
            
        }
    }
        
    var name: String? {
        get {
            return floatLabel.text
        }
        set {
            floatLabel.text = newValue
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func valueChanged(_ sender: UISlider) {
        
        value = sender.value
        
    }


}
