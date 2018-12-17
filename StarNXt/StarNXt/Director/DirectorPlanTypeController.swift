//
//  DirectorPlanTypeController.swift
//  StarNXt
//
//  Created by Mac on 12/16/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class DirectorPlanTypeController: UIViewController {

    
    var isPremiumAudition : Bool = false
    @IBOutlet weak  var premimumView : UIView!
    @IBOutlet weak  var openView : UIView!
    
    @IBOutlet weak var firstPlanCountLbl : UILabel!
    @IBOutlet weak var firstPlanTypeLbl : UILabel!
    @IBOutlet weak var firstPlanAmountLbl : UILabel!
    
    @IBOutlet weak var secondPlanCountLbl : UILabel!
    @IBOutlet weak var secondPlanTypeLbl : UILabel!
    @IBOutlet weak var secondPlanAmountLbl : UILabel!
    
    @IBOutlet weak var thirdPlanCountLbl : UILabel!
    @IBOutlet weak var thirdPlanTypeLbl : UILabel!
    @IBOutlet weak var thirdPlanAmountLbl : UILabel!

    @IBOutlet weak var viewTopConstraint : NSLayoutConstraint!
    @IBOutlet weak var navBarTitle : UILabel!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.premimumView.isHidden = true
        self.openView.isHidden = true
        self.view.createGradientLayer()
        if isPremiumAudition {
            
            navBarTitle.text = "Premium Audition"
            self.premimumView.isHidden = false
            
            self.firstPlanTypeLbl.text = "Premium Audition"
            self.firstPlanCountLbl.text = "1"
            self.firstPlanAmountLbl.text = "99"
            
            
            self.secondPlanTypeLbl.text = "Premium Auditions"
            self.secondPlanCountLbl.text = "3"
            self.secondPlanAmountLbl.text = "399"
            
            
            self.thirdPlanTypeLbl.text = "Premium Auditions"
            self.thirdPlanCountLbl.text = "5"
            self.thirdPlanAmountLbl.text = "1347"
            
            
            self.viewTopConstraint.constant = 300
        }else{
            navBarTitle.text = "Open Audition"
            self.openView.isHidden = false
            self.firstPlanTypeLbl.text = "Open Audition"
            self.firstPlanCountLbl.text = "1"
            self.firstPlanAmountLbl.text = "99"
            
            
            self.secondPlanTypeLbl.text = "Open Auditions"
            self.secondPlanCountLbl.text = "3"
            self.secondPlanAmountLbl.text = "399"
            
            
            self.thirdPlanTypeLbl.text = "Open Auditions"
            self.thirdPlanCountLbl.text = "5"
            self.thirdPlanAmountLbl.text = "1347"
            self.viewTopConstraint.constant = 209
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBackAction() -> Void{
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
