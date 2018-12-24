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
    @IBOutlet weak var auditionTypeLabel : UILabel!
    var count = 5
    var personalizedCount = 3
    var openCount = 2
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.updateUI()
        
    }
    
    func updateUI(){
        if UserDefaults.standard.getUserRole() == Constants.kDIRECTOR{
            
            count  = 3
            personalizedCount = 2
            openCount = 1
            auditionTypeLabel.text = "Post Your First \n \(count) Auditions free"
            auditionCountLabel.text = "(\(personalizedCount) Premium Auditions, \(openCount) Open Audition)"

        }else{
            count  = 5
            personalizedCount = 3
            openCount = 2
            auditionTypeLabel.text = "Apply Your First \n \(count) Auditions free"
            auditionCountLabel.text = "(\(personalizedCount) Premium Auditions, \(openCount) Open Audition)"
        }
    }
    
    @IBAction func onViewplanAction() -> Void{
        if UserDefaults.standard.getUserRole() == Constants.kACTOR{
            let actorPlanVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.actorPlanView) as! ActorViewPlanController
            self.navigationController?.pushViewController(actorPlanVc, animated: true)
            
        }else{
            let directorPlanVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.viewplanvc) as! ViewPlansController
            self.navigationController?.pushViewController(directorPlanVc, animated: true)
        }
    }
    
    @IBAction func onGetStartAction() -> Void{
        if UserDefaults.standard.getUserRole() == Constants.kACTOR{
            let actorPlanVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.actorPlanSelectionVc) as! ActorPlanSelectionController
            self.navigationController?.pushViewController(actorPlanVc, animated: true)

        }else{
            let directorPlanVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.directorPlanSelectionVc) as! DirectorPlanSelectionController
            self.navigationController?.pushViewController(directorPlanVc, animated: true)
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

}
