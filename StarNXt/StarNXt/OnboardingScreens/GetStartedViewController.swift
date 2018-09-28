//
//  GetStartedViewController.swift
//  StarNXt
//
//  Created by Mac on 9/5/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var auditionCountLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func onGetStartAction() -> Void{
        let subscriptionVc =  self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.subscriptionvc) as! SubscriptionViewController
        self.navigationController?.pushViewController(subscriptionVc, animated: true)
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
