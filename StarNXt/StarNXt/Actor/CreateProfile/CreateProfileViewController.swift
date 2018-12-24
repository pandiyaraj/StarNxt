//
//  CreateProfileViewController.swift
//  StarNXt
//
//  Created by Mac on 9/17/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class CreateProfileViewController: UIViewController {

    @IBOutlet weak var maleBtn : SNButton!
    @IBOutlet weak var femaleBtn : SNButton!
    @IBOutlet weak var transBtn : SNButton!
    
    @IBOutlet weak var knownLanguageCollectionView : UICollectionView!
    @IBOutlet weak var prefferedLanguageCollectionView : UICollectionView!
    @IBOutlet weak var auditionPrefernceCollectionView : UICollectionView!
    
    @IBOutlet weak var knownLanguageHeightConstraint : NSLayoutConstraint!
    @IBOutlet weak var prefferedLanguageHeightConstraint : NSLayoutConstraint!
    @IBOutlet weak var auditionPrefernceHeightConstraint : NSLayoutConstraint!
    
    var isFromMenu : Bool = false
    
    var knownLanguageArray = ["Tamil", "Telugu", "Kannada", "Malayalam", "Hindi", "Marathi","Bengali", "Bhojpuri", "Punjabi", "Gujarati", "English"]
    
     var preferredLanguageArray = ["Tamil", "Telugu", "Kannada", "Malayalam", "Hindi", "Marathi","Bengali", "Bhojpuri", "Punjabi", "Gujarati", "English"]
    
     var audtionPreferenceArray = ["Serial", "Web Series", "Feature Film","Short Film", "Advertisement", "Stage Play","Telefilm", "Pilot Movie", "Events"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        knownLanguageCollectionView.register(UINib.loadNib(nibName: CellIdentifier.profilecollectioncell), forCellWithReuseIdentifier: CellIdentifier.profilecollectioncell)
        prefferedLanguageCollectionView.register(UINib.loadNib(nibName: CellIdentifier.profilecollectioncell), forCellWithReuseIdentifier: CellIdentifier.profilecollectioncell)
        auditionPrefernceCollectionView.register(UINib.loadNib(nibName: CellIdentifier.profilecollectioncell), forCellWithReuseIdentifier: CellIdentifier.profilecollectioncell)
        
        self.title = "Create Profile"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: " ", style: .plain, target: self, action: nil)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)

        self.navigationController?.navigationBar.barTintColor = UIColor.white
        

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isFromMenu{
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
            self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
            
            let hamburgerBtn = UIBarButtonItem.init(image: UIImage.init(named: "hamburger_menu"), style: .done, target: self, action:#selector(hamburgerMenuAction(_:)))
            self.navigationItem.leftBarButtonItem = hamburgerBtn
            self.tabBarController?.tabBar.isHidden = false
        }
    }
    @objc func hamburgerMenuAction(_ sender: Any) {
        self.slideMenuController()?.openLeft()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.updateUI()
    }

    func updateUI() -> Void{
//        knownLanguageHeightConstraint.constant = CGFloat(((knownLanguageArray.count / 2 ) + 1 ) * 32)
//        prefferedLanguageHeightConstraint.constant = CGFloat(((preferredLanguageArray.count / 2 ) + 1 ) * 32)
//        auditionPrefernceHeightConstraint.constant = CGFloat(((audtionPreferenceArray.count / 2 ) + 1 ) * 32)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func genderAction(sender : SNButton) -> Void{
        
        maleBtn.isSelected = false
        femaleBtn.isSelected = false
        transBtn.isSelected = false
        
        sender.isSelected = true
        
    }
    
    @IBAction func onNextAction() -> Void{
        let portfolioVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.portfolioVc) as! PortfolioViewController
        self.navigationController?.pushViewController(portfolioVc, animated: true)
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
