//
//  SubscriptionViewController.swift
//  StarNXt
//
//  Created by Mac on 9/5/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit
//import InstaMojoiOS
//import Instamojo

class SubscriptionViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.createGradientLayer()
        self.title = "Choose plan"

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func planHistoryAction() -> Void{
        
    }
    
    @IBAction func onSubscriptionSelect() -> Void{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.actorDashboardApplication()
  
    }
    
    
    func setupPayment() -> Void{
        
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
