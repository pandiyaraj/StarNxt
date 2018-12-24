//
//  AuditionTableViewCell.swift
//  StarNXt
//
//  Created by Mac on 9/10/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class AuditionTableViewCell: UITableViewCell {

    @IBOutlet weak var auditionNameLbl : UILabel!
    @IBOutlet weak var audtionProjectLbl : UILabel!
    @IBOutlet weak var audtionStatusLbl: UILabel!
    @IBOutlet weak var directorLbl : UILabel!
    @IBOutlet weak var postedByLbl : UILabel!
    @IBOutlet weak var postedOnLbl : UILabel!
    @IBOutlet weak var lastDateLbl : UILabel!
    @IBOutlet weak var lastDateKeyLbl : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
