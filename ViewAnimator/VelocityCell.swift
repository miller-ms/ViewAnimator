//
//  VelocityCell.swift
//  ViewAnimator
//
//  Created by William Miller on 5/3/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
//

import UIKit

class VelocityCell: UITableViewCell {

    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var slider: UISlider!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
