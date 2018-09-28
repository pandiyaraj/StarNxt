//
//  ApplicationTableViewCell.swift
//  StarNXt
//
//  Created by Mac on 9/23/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit
import OnlyPictures

class ApplicationTableViewCell: UITableViewCell {

    @IBOutlet weak var applicationTitleLbl : UILabel!
    @IBOutlet weak var applicationCountLbl : UILabel!
    @IBOutlet weak var applicationStatusLbl: UILabel!
    @IBOutlet weak var newProfileLbl : UILabel!
    
    @IBOutlet weak var pictureView : OnlyHorizontalPictures!
    @IBOutlet weak var moreBtn : UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
