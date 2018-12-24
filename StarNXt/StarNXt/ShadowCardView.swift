//
//  ShadowCardView.swift
//  StarNXt
//
//  Created by Mac on 12/21/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ShadowCardView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    
    
    override func layoutSubviews() {
        
        self.layer.borderWidth = 0.25
        
        self.layer.borderColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.24).cgColor
        
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.shadowColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.24).cgColor
        
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        self.layer.shadowRadius = 1
        
        self.layer.shadowOpacity = 1
        
        self.layer.masksToBounds = false
        
        self.layer.cornerRadius = 2.0
        
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).cgPath
        
    }

}
