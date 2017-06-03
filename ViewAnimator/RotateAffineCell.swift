//
//  RotateAffineCell.swift
//  ViewAnimator
//
//  Created by William Miller on 5/29/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
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
