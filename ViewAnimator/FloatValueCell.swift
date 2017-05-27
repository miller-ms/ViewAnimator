//
//  FloatValueCell.swift
//  ViewAnimator
//
//  Created by William Miller on 5/22/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
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
