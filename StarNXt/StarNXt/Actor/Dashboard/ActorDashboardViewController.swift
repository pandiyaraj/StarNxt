//
//  ActorDashboardViewController.swift
//  StarNXt
//
//  Created by Mac on 9/9/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ActorDashboardViewController: UIViewController {

    @IBOutlet weak var personalizedAuditionView : UIView!
    @IBOutlet weak var openAuditionView : UIView!
    @IBOutlet weak var resourceSearchView : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
       


        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.personalizedAuditionView.createGradientLayerColor(color1: UIColor(red: 0.42, green: 0.07, blue: 0.80, alpha: 1), color2: UIColor(red: 0.15, green: 0.46, blue: 0.99, alpha: 1))
        
        self.openAuditionView.createGradientLayerColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
        
        self.resourceSearchView.createGradientLayerColor(color1: UIColor(red: 0.19, green: 0.14, blue: 0.68, alpha: 1), color2: UIColor(red: 0.78, green: 0.43, blue: 0.84, alpha: 1))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func personlaizedAudionAction() -> Void{
        let audtionVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.auditionvc) as! AuditionViewController
        audtionVc.isOpenAudition = false
        self.navigationController?.pushViewController(audtionVc, animated: true)
    }
    
    @IBAction func openAudionAction() -> Void{
        let audtionVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.auditionvc) as! AuditionViewController
        audtionVc.isOpenAudition = true
        self.navigationController?.pushViewController(audtionVc, animated: true)
    }
    
    @IBAction func resourceAction() -> Void{
        let resourceVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.resourcevc) as! ResourceViewController
        self.navigationController?.pushViewController(resourceVc, animated: true)
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
