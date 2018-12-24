//
//  ActorPlanSelectionController.swift
//  StarNXt
//
//  Created by Mac on 12/19/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ActorPlanSelectionController: UIViewController {

    @IBOutlet weak var firstPlanCountLbl : UILabel!
    @IBOutlet weak var firstPlanTypeLbl : UILabel!
    @IBOutlet weak var firstPlanAmountLbl : UILabel!
    
    @IBOutlet weak var secondPlanCountLbl : UILabel!
    @IBOutlet weak var secondPlanTypeLbl : UILabel!
    @IBOutlet weak var secondPlanAmountLbl : UILabel!
    
    @IBOutlet weak var thirdPlanCountLbl : UILabel!
    @IBOutlet weak var thirdPlanTypeLbl : UILabel!
    @IBOutlet weak var thirdPlanAmountLbl : UILabel!
    
    @IBOutlet weak var fourthPlanCountLbl : UILabel!
    @IBOutlet weak var fourthPlanTypeLbl : UILabel!
    @IBOutlet weak var fourthPlanAmountLbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.createGradientLayer()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    @IBAction func onChoosePlanAction() -> Void{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.actorDashboardApplication()
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
