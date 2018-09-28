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
        delegate = self
        createBorder()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        createBorder()
    }
    
    func createBorder() {
        self.addBorder(edges: .bottom, colour: UIColor.init(hex: 0xCCCCCC), thickness: 1.0)
        self.cornerRadius = 4.0
    }
}
