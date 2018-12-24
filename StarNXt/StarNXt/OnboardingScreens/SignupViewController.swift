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
    @IBOutlet weak var mobileNumberTF : SNTextField!
    
    @IBOutlet weak var OTPView : UIView!
    @IBOutlet weak var otpTF : SNTextField!
    @IBOutlet weak var mobileNumberLbl : UILabel!
    
    var userRole : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mobileNumberTF.text = "9092337961"
        self.mobileNumberTF.delegate = self
        self.otpTF.delegate  = self
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Button Actions
    @IBAction func onNextAction() -> Void{
        if (mobileNumberTF.text?.count)! < 0 {
            self.showAlert(title: "Message", contentText: "Please enter mobile number", actions: nil)
        }else if !(mobileNumberTF.text?.isPhoneNumber)!{
            self.showAlert(title: "Message", contentText: "Please enter valid mobile number", actions: nil)
        }else{
            
            //TODO the process
            GeneralnfoModel.sharedGeneralInfo.userMobileNumber = self.mobileNumberTF.text!
            self.mobileNumberLbl.text = "You will receive a confirmation code via SMS to '\(GeneralnfoModel.sharedGeneralInfo.userMobileNumber)'"
            
            self.OTPView.isHidden = false
            self.otpTF.text = ""
        }
    }
    
    
    //MARK: OTP View Action
    
    @IBAction func onResendAction() -> Void{
        self.OTPView.isHidden = true
    }
    
    @IBAction func onVerifyAction() -> Void{
        
        if userRole == Constants.kDIRECTOR{
            //TODO Verify
            UserDefaults.standard.setUserRole(value: Constants.kDIRECTOR, key: Defaults.userRole)
            let directorProfileVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.createDirectorProfilevc) as! CreateDirectorProfileViewController
            self.navigationController?.pushViewController(directorProfileVc, animated: true)
        }else{
            UserDefaults.standard.setUserRole(value: Constants.kACTOR, key: Defaults.userRole)
            let actorProfileVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.createprofilevc) as! CreateProfileViewController
            self.navigationController?.pushViewController(actorProfileVc, animated: true)
        }
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension SignupViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let tf = textField as? SNTextField{
            tf.setBorderColor(selected: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let tf = textField as? SNTextField{
            tf.setBorderColor(selected: false)
        }
    }
}
