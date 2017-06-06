//
//  ColorCell.swift
//  ViewAnimator
//
//  Created by William Miller DBA Miller Mobilesoft on 5/16/17.
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

class ColorCell: UITableViewCell {

    @IBOutlet weak var lblRGB: UILabel!
    @IBOutlet weak var lblAlpha: UILabel!
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var sliderAlpha: UISlider!
    
    var alphaProperty:CGFloat = 1.0 {
        didSet {
            guard (lblAlpha != nil) else {
                return
            }
            
            let formatter = NumberFormatter()

            formatter.numberStyle = .decimal
            
            formatter.maximumFractionDigits = 2
            
            formatter.minimumFractionDigits = 2
            
            formatter.maximumIntegerDigits = 1
            
            formatter.minimumIntegerDigits = 1
            
            lblAlpha.text = formatter.string(from: NSNumber(value: Double(alphaProperty)))
            
            viewColor.alpha = alphaProperty
            
        }
    }
    
    var colorProperty:UIColor = UIColor.white {
        didSet {
            guard (lblRGB != nil) && (viewColor != nil) else {
                return
            }
            
            viewColor.backgroundColor = colorProperty
            
            let red = colorProperty.cgColor.components?[0]
            let green = colorProperty.cgColor.components?[1]
            let blue = colorProperty.cgColor.components?[2]
            
            let formatter = NumberFormatter()
            
            formatter.numberStyle = .decimal
            
            formatter.maximumFractionDigits = 0
            
            formatter.minimumFractionDigits = 0
            
            formatter.maximumIntegerDigits = 3
            
            formatter.minimumIntegerDigits = 1
            
            var rgbDescription = "R: " + formatter.string(from: NSNumber(value: (UInt(red! * 255))))!
            rgbDescription +=  " G: " + formatter.string(from: NSNumber(value: (UInt(green! * 255))))!
            rgbDescription +=  " B: " + formatter.string(from: NSNumber(value: (UInt(blue! * 255))))!
            
            lblRGB.text = rgbDescription
            
        }
    }
    
    func showData () {
        
        let red = viewColor.backgroundColor?.cgColor.components?[0]
        let green = viewColor.backgroundColor?.cgColor.components?[1]
        let blue = viewColor.backgroundColor?.cgColor.components?[2]
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        
        formatter.maximumFractionDigits = 0
        
        formatter.minimumFractionDigits = 0
        
        formatter.maximumIntegerDigits = 3
        
        formatter.minimumIntegerDigits = 1
        
        var rgbDescription = "R: " + formatter.string(from: NSNumber(value: (UInt(red! * 255))))!
        rgbDescription +=  " G: " + formatter.string(from: NSNumber(value: (UInt(green! * 255))))!
        rgbDescription +=  " B: " + formatter.string(from: NSNumber(value: (UInt(blue! * 255))))!
        
        lblRGB.text = rgbDescription
        
        formatter.maximumFractionDigits = 2
        
        formatter.minimumFractionDigits = 2
        
        formatter.maximumIntegerDigits = 1
        
        formatter.minimumIntegerDigits = 1
        
        lblAlpha.text = formatter.string(from: NSNumber(value: sliderAlpha.value))

    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func alphaChanged(_ sender: UISlider) {
        
        alphaProperty = CGFloat(sender.value)

    }

    @IBAction func alphaEndChanged(_ sender: UISlider) {
        
        alphaProperty = CGFloat(sender.value)
        
    }
    
    
    @IBAction func alphaStartChanged(_ sender: UISlider) {
        
        alphaProperty = CGFloat(sender.value)

    }

}
