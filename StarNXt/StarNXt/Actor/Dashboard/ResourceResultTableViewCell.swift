//
//  ResourceResultTableViewCell.swift
//  StarNXt
//
//  Created by Mac on 9/13/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ResourceResultTableViewCell: UITableViewCell {

    @IBOutlet weak var resourceProfileImageView : UIImageView!
    @IBOutlet weak var resourceName : UILabel!
    @IBOutlet weak var resourceDescription : UILabel!
    @IBOutlet weak var browseBtn : UIButton!
    @IBOutlet weak var phoneBtn : UIButton!
    @IBOutlet weak var locationBtn : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
