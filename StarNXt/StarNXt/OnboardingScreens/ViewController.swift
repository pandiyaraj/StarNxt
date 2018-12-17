//
//  ViewController.swift
//  StarNXt
//
//  Created by Mac on 9/3/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var termsAndConditions : UILabel!
    @IBOutlet weak var nextBtn : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let attributedText = NSMutableAttributedString(string: "Tap “Agree and continue” to accept the", attributes: [NSAttributedStringKey.font: AppFont.getRegular(size: 13),NSAttributedStringKey.foregroundColor : UIColor.init(hex: 0x808080)])
        
        attributedText.append(NSAttributedString(string: " StarNXT Terms of Service", attributes: [NSAttributedStringKey.font: AppFont.getRegular(size: 13),NSAttributedStringKey.foregroundColor : UIColor.init(hex: 0xff1264)]))
        
        attributedText.append(NSAttributedString(string: " and", attributes: [NSAttributedStringKey.font: AppFont.getRegular(size: 13),NSAttributedStringKey.foregroundColor : UIColor.init(hex: 0x424242)]))
        
        attributedText.append(NSAttributedString(string: " Privacy Policy", attributes: [NSAttributedStringKey.font: AppFont.getRegular(size: 13),NSAttributedStringKey.foregroundColor : UIColor.init(hex: 0xff1264)]))
        
        termsAndConditions.attributedText = attributedText
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

