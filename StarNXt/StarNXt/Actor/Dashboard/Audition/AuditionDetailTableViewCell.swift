//
//  AuditionDetailTableViewCell.swift
//  StarNXt
//
//  Created by Mac on 9/11/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class AuditionDetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var detailLabel : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
