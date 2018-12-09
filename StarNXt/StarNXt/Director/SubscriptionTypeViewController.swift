//
//  SubscriptionTypeViewController.swift
//  StarNXt
//
//  Created by Mac on 11/29/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class SubscriptionTypeViewController: UIViewController {

    var isAuditionType : Int = 0
    
    @IBOutlet weak var titileLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    
    @IBOutlet weak var firstSlotAmountLbl : UILabel!
    @IBOutlet weak var firstSlotCountLbl : UILabel!
    
    @IBOutlet weak var secondSlotAmountLbl : UILabel!
    @IBOutlet weak var secondSlotCountLbl : UILabel!
    
    @IBOutlet weak var thirdSlotAmountLbl : UILabel!
    @IBOutlet weak var thirdSlotCountLbl : UILabel!

    var amount = [Int]()
    var countArray = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.createGradientLayer()
        
        if isAuditionType == 1{
            //Personlaized
            self.titileLabel.text = "Personalized Audition"
            self.descriptionLabel.text = "You will be getting applications based on your requirements such as gender, age, language, measurement, state and city.\n\n You can shortlist the profiles based on your character list. "
            amount = [199,499,1499]
            countArray = [1,3,5]
            
            self.updateAmountViews(audtionType: "Personalized")

            
        }else if isAuditionType == 2{
            //Open
            self.titileLabel.text = "Open Audition"
            self.descriptionLabel.text = "Post your audition with all the details, address and contact details."
            amount = [199,358,497]
            countArray = [1,3,5]
            self.updateAmountViews(audtionType: "Open")

        }
       
        // Do any additional setup after loading the view.
    }
    
    func updateAmountViews(audtionType : String) -> Void{
        for index in 0..<amount.count {
            switch index{
            case 0:
                self.firstSlotAmountLbl.text  = "\(amount[index])"
                self.firstSlotCountLbl.text = "\(countArray[index]) \(audtionType) Audition"
            case 1:
                self.secondSlotAmountLbl.text  = "\(amount[index])"
                self.secondSlotCountLbl.text = "\(countArray[index]) \(audtionType) Audition"
            case 2:
                self.thirdSlotAmountLbl.text  = "\(amount[index])"
                self.thirdSlotCountLbl.text = "\(countArray[index]) \(audtionType) Audition"
            default:
                self.firstSlotAmountLbl.text  = "\(amount[index])"
                self.firstSlotCountLbl.text = "\(countArray[index]) \(audtionType) Audition"
        }
    }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    
    @IBAction func onSelectAction(sender : UIButton)-> Void{
        self.purchaseSuccess()
        switch sender.tag {
        case 1:
            
            break
        case 2:
            break
        case 3:
            break
        default:
            print("nothing")
        }
    }
    
    func purchaseSuccess() -> Void{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.directorDashboardApplication()
    }
    
    @IBAction func onBackAction() {
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
