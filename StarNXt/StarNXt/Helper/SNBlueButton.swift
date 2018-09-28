//
//  SNBlueButton.swift
//  StarNXt
//
//  Created by Mac on 9/22/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class SNBlueButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        self.commoninit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commoninit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    private func image(withColor color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func setBackgroundColor(_ color: UIColor, for state: UIControlState) {
        self.setBackgroundImage(image(withColor: color), for: state)
    }
    
    func commoninit(){
        self.cornerRadius = 16
        self.setTitleColor(UIColor.init(hex: 0x424242), for: .normal)
        self.setTitleColor(UIColor.white, for: .selected)
        self.titleLabel?.font = AppFont.getRegular(size: 16)
        self.setBackgroundColor(UIColor.init(hex: 0xf2f4f9), for: .normal)
        self.setBackgroundColor(UIColor.init(hex: 0x6912cc), for: .selected)
    }
}
