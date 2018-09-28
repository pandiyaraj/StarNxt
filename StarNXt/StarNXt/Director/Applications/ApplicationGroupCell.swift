//
//  ApplicationGroupCell.swift
//  StarNXt
//
//  Created by Mac on 9/25/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ApplicationGroupCell: UITableViewCell {

    @IBOutlet weak var profileImageView : UIImageView!
    @IBOutlet weak var profileName : UILabel!
    @IBOutlet weak var profileAge : UILabel!
    @IBOutlet weak var shortListBtn : UIButton!
    @IBOutlet weak var shortListLabel : UILabel!
    @IBOutlet weak var removeBtn : UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
