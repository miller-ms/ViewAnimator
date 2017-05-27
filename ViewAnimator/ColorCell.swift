//
//  ColorCell.swift
//  ViewAnimator
//
//  Created by William Miller on 5/16/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
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
