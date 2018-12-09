//
//  DirectorSubscriptionViewController.swift
//  StarNXt
//
//  Created by Mac on 11/29/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class DirectorSubscriptionViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.createGradientLayer()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func onPersonalizedAction() -> Void{
        let subscriptTypeVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.directorSubscriptTypeVc) as! SubscriptionTypeViewController
        subscriptTypeVc.isAuditionType = 1
        self.navigationController?.pushViewController(subscriptTypeVc, animated: true)
    }
    
    @IBAction func onOpenAction() -> Void{
        let subscriptTypeVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.directorSubscriptTypeVc) as! SubscriptionTypeViewController
        subscriptTypeVc.isAuditionType = 2
        self.navigationController?.pushViewController(subscriptTypeVc, animated: true)
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
