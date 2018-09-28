//
//  SNCardView.swift
//  StarNXt
//
//  Created by Mac on 9/22/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class SNCardView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        self.cornerRadius = 2
        self.borderColor = UIColor.init(hex: 0x000000, transparency: 0.5)
        self.borderWidth = 0.25
        self.shadowColor = UIColor.black
        self.shadowOffset = CGSize(width: 1, height: 3)
        self.shadowOpacity = 1.0
        self.shadowRadius = 1.0
    }
}
