//
//  UILabelExtensions.swift
//  Sconce
//
//  Created by Pandiyaraj on 30/05/18.
//  Copyright © 2017 Pandiyaraj. All rights reserved.
//

import UIKit

public extension UILabel {
	
	/// Return required height for a label
	public var requiredHeight: CGFloat {
		let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
		label.numberOfLines = 0
		label.lineBreakMode = NSLineBreakMode.byWordWrapping
		label.font = font
		label.text = text
		label.attributedText = attributedText
		label.sizeToFit()
		return label.frame.height
	}
    
        func setDifferentColor(string: String, location: Int, length: Int){
            
            let attText = NSMutableAttributedString(string: string)
            attText.addAttribute(kCTForegroundColorAttributeName as NSAttributedStringKey, value: UIColor.init(hex: 0x0052F9), range: NSRange(location: location,length: length))
            attributedText = attText
            
        }
}


extension UIButton {
    /// Return required height for a label
    public var requiredwidth: CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = titleLabel?.font
        label.text = titleLabel?.text
        label.sizeToFit()
        return label.frame.width+15
    }
    
}
