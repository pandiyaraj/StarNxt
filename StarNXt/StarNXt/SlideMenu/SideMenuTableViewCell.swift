//
//  SideMenuTableViewCell.swift
//  StarNXt
//
//  Created by Mac on 9/17/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabl : UILabel!
    @IBOutlet weak var iconImageView : UIImageView!
    @IBOutlet weak var  notificationSwitch :  UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
