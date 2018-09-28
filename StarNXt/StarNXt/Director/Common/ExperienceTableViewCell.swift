//
//  ExperienceTableViewCell.swift
//  StarNXt
//
//  Created by Mac on 9/22/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {

    @IBOutlet weak var titlelbl : UILabel!
    @IBOutlet weak var checkBtn : UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
