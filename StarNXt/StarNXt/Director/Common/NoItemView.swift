//
//  NoItemView.swift
//  StarNXt
//
//  Created by Mac on 9/23/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class NoItemView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet var contentView: UIView!
    @IBOutlet var titleLbl : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commoninit()
    }
    
    override func awakeFromNib() {
        commoninit()
    }
    
    func commoninit(){
        Bundle.main.loadNibNamed("NoItemView", owner: self, options: [:])
        addSubview(contentView)        
    }
 
}
