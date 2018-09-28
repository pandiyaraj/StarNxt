//
//  MeasurementTableViewCell.swift
//  StarNXt
//
//  Created by Mac on 9/22/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class MeasurementTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl : UILabel!
    @IBOutlet weak var detailTitleLbl : UILabel!
    @IBOutlet weak var measurementHeightView : UIView!
    @IBOutlet weak var measurmentHeightLbl : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
