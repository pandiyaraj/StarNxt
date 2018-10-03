//
//  LaunchView.swift
//  StarNXt
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class LaunchView: UIView {

    
    @IBOutlet weak var contentView : UIView!
    @IBOutlet weak var profileimageView : UIImageView!
    @IBOutlet weak var titleLbl : UILabel!
    @IBOutlet weak var subTitleLbl : UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
   /* override init(frame: CGRect) {
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
        Bundle.main.loadNibNamed("LaunchView", owner: self, options: [:])
        addSubview(contentView)
    }
*/
    
}
