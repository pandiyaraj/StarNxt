//
//  ShadowButton.swift
//  SampleSwift1
//
//  Created by Apple on 12/18/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ShadowButton: UIButton {
   
    let shadowLayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setupText()

       // fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        self.setupText()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupLayer(frame: self.bounds)
    }
    
    convenience init(frame: CGRect,color:UIColor, shadowColor:UIColor) {
        self.init(frame: frame)
        layer.cornerRadius = 2
        layer.masksToBounds = true
    }
    
    
    func setupLayer(frame : CGRect) -> Void{
//        shadowLayer.path = UIBezierPath(roundedRect: frame, cornerRadius: 2).cgPath
//        shadowLayer.fillColor = UIColor.init(hex: 0xff1462).cgColor
//        shadowLayer.shadowColor = UIColor.black.cgColor
//        shadowLayer.shadowPath = shadowLayer.path
//        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 5)
//        shadowLayer.shadowOpacity = 0.25
//        shadowLayer.shadowRadius = 2
//        shadowLayer.cornerRadius = 2
//        layer.insertSublayer(shadowLayer, at: 0)
        
        self.layer.backgroundColor = UIColor.init(hex: 0xff1462).cgColor
        
        self.layer.shadowColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.24).cgColor
        
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        self.layer.shadowRadius = 1
        
        self.layer.shadowOpacity = 1
        
        self.layer.masksToBounds = false
        
        self.layer.cornerRadius = 2.0
        
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).cgPath
    }
    
    func setupText() -> Void{
        
        self.titleLabel?.font = AppFont.getMedium(size: 17)
        self.setTitleColor(UIColor.white, for: .normal)
    }

}
