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
    @IBOutlet weak var resourcesView : UIView!
    @IBOutlet weak var auditionProfileView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title =  "StarNXT"
       
        // Do any additional setup after loading the view.
    }
    
    @objc func hamburgerMenuAction(_ sender: Any) {
        self.slideMenuController()?.openLeft()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: " ", style: .plain, target: self, action: nil)
        self.view.backgroundColor = UIColor.init(red: 243.0/255.0, green: 247.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
       
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
        
        let hamburgerBtn = UIBarButtonItem.init(image: UIImage.init(named: "hamburger_menu"), style: .done, target: self, action:#selector(hamburgerMenuAction(_:)))
        self.navigationItem.leftBarButtonItem = hamburgerBtn
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    override func viewDidAppear(_ animated: Bool) {
        self.personalizedAuditionView.createGradientLayerColor(color1: UIColor(red: 0.42, green: 0.07, blue: 0.80, alpha: 1), color2: UIColor(red: 0.15, green: 0.46, blue: 0.99, alpha: 1),locations: true)
        
        self.openAuditionView.createGradientLayerColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
        
        self.resourcesView.createGradientLayerColor(color1: UIColor(red: 0.19, green: 0.14, blue: 0.68, alpha: 1), color2: UIColor(red: 0.78, green: 0.43, blue: 0.84, alpha: 1))
        
        self.auditionProfileView.createGradientLayerColor(color1: UIColor(red: 0.32, green: 0.71, blue: 0.28, alpha: 1), color2: UIColor(red: 0.01, green: 0.66, blue: 0.73, alpha: 1),locations: true)
    }
    
    @IBAction func onPostPersonalisedAction() -> Void{
        let personalisedVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.personalisedAuditionvc) as! PersonalisedViewController
        self.navigationController?.pushViewController(personalisedVc, animated: true)
    }
    
    @IBAction func onPostOpenAction() -> Void{
        let openauditionVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.openAuditionVc) as! OpenAuditionViewController
        self.navigationController?.pushViewController(openauditionVc, animated: true)
    }
    
    @IBAction func onResourceAction() -> Void{
        let resourceVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.resourcevc) as! ResourceViewController
        self.navigationController?.pushViewController(resourceVc, animated: true)
    }
    
    @IBAction func onAuditionProfileAction() -> Void{
        let openauditionVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.directorAuditionListVc) as! DirectorAuditionListViewController
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
