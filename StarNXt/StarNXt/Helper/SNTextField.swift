//
//  SNTextField.swift
//  StarNXt
//
//  Created by Mac on 9/4/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class SNTextField: UITextField, UITextFieldDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
//        createBorder()
        self.setBorderColor(selected: false)
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
//        createBorder()
        self.setBorderColor(selected: false)

    }
    
    func createBorder() {
        self.addBorder(edges: .bottom, colour:Themecolor.placeholdercolor , thickness: 1.0)
//        self.cornerRadius = 4.0
    }
    
    func setBorderColor(selected : Bool) -> Void{
        if selected{
            self.addBorder(edges: .bottom, colour:Themecolor.placeholderSelectedColor , thickness: 1.0)
        }else{
            
            self.addBorder(edges: .bottom, colour: Themecolor.placeholdercolor , thickness: 1.0)
        }
        self.layer.masksToBounds = true
    }
}
