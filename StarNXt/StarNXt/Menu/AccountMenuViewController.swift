//
//  AccountMenuViewController.swift
//  StarNXt
//
//  Created by Mac on 9/6/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class AccountMenuViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let hamburgerBtn = UIBarButtonItem.init(image: UIImage.init(named: "hamburger_menu"), style: .done, target: self, action:#selector(hamburgerMenuAction(_:)))
        self.navigationItem.leftBarButtonItem = hamburgerBtn
        
        self.title = "Account"
        // Do any additional setup after loading the view.
    }
    
    @objc func hamburgerMenuAction(_ sender: Any) {
        self.slideMenuController()?.openLeft()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onChangeNumberAction() -> Void{
        let changeNumber = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.changeNumberVc) as! ChangeNumberViewController
        self.navigationController?.pushViewController(changeNumber, animated: true)
    }
    
    @IBAction func onDeleteAccount() -> Void{
        let deleteAccount = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.deleteAccountVc) as! DeleteAccountViewController
        self.navigationController?.pushViewController(deleteAccount, animated: true)
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
