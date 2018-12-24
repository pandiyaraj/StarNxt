//
//  DirectorAuditionListTableViewCell.swift
//  StarNXt
//
//  Created by Mac on 9/23/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class DirectorAuditionListTableViewCell: UITableViewCell {

    @IBOutlet weak var auditionTypeLbl : UILabel!
    @IBOutlet weak var auditionTeamLbl : UILabel!
    @IBOutlet weak var auditionDirectorNameLbl : UILabel!
    @IBOutlet weak var auditionProjectLbl : UILabel!
    @IBOutlet weak var auditionTitleLbl : UILabel!
    @IBOutlet weak var auditionPostedDateLbl : UILabel!


    @IBOutlet weak var applicationReceivedLbl : UILabel!
    @IBOutlet weak var auditionStatusLbl : UILabel!
    
    @IBOutlet weak var auditionsReceivedButton : UIButton!
    @IBOutlet weak var profileShortlistButton : UIButton!
    
    @IBOutlet weak var auditionOpenTypeDurationLabel : UILabel!
    @IBOutlet weak var auditionOpenTypeDurationValueLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
