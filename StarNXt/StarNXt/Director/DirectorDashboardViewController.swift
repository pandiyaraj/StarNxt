//
//  DirectorDashboardViewController.swift
//  StarNXt
//
//  Created by Mac on 9/23/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class DirectorDashboardViewController: UIViewController {

    @IBOutlet weak var personalizedAuditionView : UIView!
    @IBOutlet weak var openAuditionView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title =  "StarNXT"
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: " ", style: .plain, target: self, action: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.personalizedAuditionView.createGradientLayerColor(color1: UIColor(red: 0.42, green: 0.07, blue: 0.80, alpha: 1), color2: UIColor(red: 0.15, green: 0.46, blue: 0.99, alpha: 1))
        
        self.openAuditionView.createGradientLayerColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
        
    }
    
    @IBAction func onPostPersonalisedAction() -> Void{
        let personalisedVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.personalisedAuditionvc) as! PersonalisedViewController
        self.navigationController?.pushViewController(personalisedVc, animated: true)
    }
    
    @IBAction func onPostOpenAction() -> Void{
        let openauditionVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.openAuditionVc) as! OpenAuditionViewController
        self.navigationController?.pushViewController(openauditionVc, animated: true)
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
