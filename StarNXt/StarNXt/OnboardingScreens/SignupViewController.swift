//
//  SignupViewController.swift
//  StarNXt
//
//  Created by Mac on 9/3/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var mobileNumberView : UIView!
    @IBOutlet weak var mobileNumberTF : UITextField!
    
    @IBOutlet weak var OTPView : UIView!
    @IBOutlet weak var otpTF : SNTextField!
    @IBOutlet weak var mobileNumberLbl : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mobileNumberTF.text = "1234567890"
        mobileNumberView.addBorder(edges: .bottom, colour: UIColor.init(hex: 0x757575), thickness: 1)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    //MARK: - Button Actions
    @IBAction func onNextAction() -> Void{
        if (mobileNumberTF.text?.count)! < 0 {
            self.showAlert(title: "Message", contentText: "Please enter mobile number", actions: nil)
        }else if !(mobileNumberTF.text?.isPhoneNumber)!{
            self.showAlert(title: "Message", contentText: "Please enter valid mobile number", actions: nil)
        }else{
            //TODO the process
            self.OTPView.isHidden = false
            self.otpTF.text = ""
        }
    }
    
    
    //MARK: OTP View Action
    
    @IBAction func onResendAction() -> Void{
        self.OTPView.isHidden = true
    }
    
    @IBAction func onVerifyAction() -> Void{
        //TODO Verify
        let getstartedVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.getstartedvc) as!  GetStartedViewController
        self.navigationController?.pushViewController(getstartedVc, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
