//
//  DeleteAccountViewController.swift
//  StarNXt
//
//  Created by Mac on 9/15/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class DeleteAccountViewController: BaseViewController {

    
    @IBOutlet weak var otpView : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.otpView.isHidden = true
        self.title = "Delete Account"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onDoneAction() -> Void{
        self.otpView.isHidden = false
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
