//
//  ProfileSelectionViewController.swift
//  StarNXt
//
//  Created by Mac on 9/3/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ProfileSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)
    }
    
    @IBAction func  onDirectorRoleAction() -> Void{
//        UserDefaults.standard.setUserRole(value: Constants.kDIRECTOR, key: Defaults.userRole)
        let tutorialVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.tutorialvc) as! TutorialViewController
        tutorialVc.userRole = UserRole.Director
        self.navigationController?.pushViewController(tutorialVc, animated: true)
    }
    
    @IBAction func onActorRoleAction() -> Void{
//        UserDefaults.standard.setUserRole(value: Constants.kACTOR, key: Defaults.userRole)
        let tutorialVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.tutorialvc) as! TutorialViewController
        tutorialVc.userRole = UserRole.Actor
        self.navigationController?.pushViewController(tutorialVc, animated: true)
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
