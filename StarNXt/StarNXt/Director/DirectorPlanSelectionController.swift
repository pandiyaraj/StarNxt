//
//  DirectorPlanSelectionController.swift
//  StarNXt
//
//  Created by Mac on 12/16/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class DirectorPlanSelectionController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.createGradientLayer()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: " ", style: .plain, target: self, action: nil)


        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func onOpenAudtionAction() -> Void{
        let directorplantypevc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.directorPlanTypeVc) as! DirectorPlanTypeController
        directorplantypevc.isPremiumAudition = false
        self.navigationController?.pushViewController(directorplantypevc, animated: true)
    }
    
    @IBAction func onPersonalizedAction() -> Void{
        let directorplantypevc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.directorPlanTypeVc) as! DirectorPlanTypeController
        directorplantypevc.isPremiumAudition = true
        self.navigationController?.pushViewController(directorplantypevc, animated: true)
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
