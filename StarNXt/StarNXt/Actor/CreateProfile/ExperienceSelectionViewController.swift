//
//  ExperienceSelectionViewController.swift
//  StarNXt
//
//  Created by Mac on 9/16/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit
import GrowingTextView

class ExperienceSelectionViewController: BaseViewController {

    @IBOutlet weak var movieExperienceGrowingTextView : GrowingTextView!
    @IBOutlet weak var stageplayExperienceGrowingTextView : GrowingTextView!
    @IBOutlet weak var actingtraingExperienceGrowingTextView : GrowingTextView!
    @IBOutlet weak var actingtraingInstituteExperienceGrowingTextView : GrowingTextView!
    @IBOutlet weak var shortfilmExperienceGrowingTextView : GrowingTextView!
    
    @IBOutlet weak var movieExperinceNoBtn : UIButton!
    @IBOutlet weak var moviewExperinceYesBtn : UIButton!
    
    @IBOutlet weak var stageplayExperinceNoBtn : UIButton!
    @IBOutlet weak var stageplayExperinceYesBtn : UIButton!
    
    @IBOutlet weak var actingExperinceNoBtn : UIButton!
    @IBOutlet weak var actingExperinceYesBtn : UIButton!
    
    @IBOutlet weak var shortfilmExperinceNoBtn : UIButton!
    @IBOutlet weak var shortfilmExperinceYesBtn : UIButton!
    
    @IBOutlet weak var movieExperienceHeightConstriant : NSLayoutConstraint!
    @IBOutlet weak var stagePlayExperienceHeightConstriant : NSLayoutConstraint!
    @IBOutlet weak var actingExperienceHeightConstriant : NSLayoutConstraint!
    @IBOutlet weak var shortfilmExperienceHeightConstriant : NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        self.title = "Experience"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
        
        
        self.moviewExperienceButtonAction(self.moviewExperinceYesBtn)
        self.actingExperienceButtonAction(self.actingExperinceYesBtn)
        self.stagePlayExperienceButtonAction(self.stageplayExperinceYesBtn)
        self.shortfilmExperienceButtonAction(self.shortfilmExperinceYesBtn)
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ii(_ sender: Any) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.movieExperienceGrowingTextView.addBottomBorderWithColor(color: UIColor.init(hex: 0x000000, transparency: 0.24), width: 1)
        self.stageplayExperienceGrowingTextView.addBottomBorderWithColor(color: UIColor.init(hex: 0x000000, transparency: 0.24), width: 1)
        self.actingtraingExperienceGrowingTextView.addBottomBorderWithColor(color: UIColor.init(hex: 0x000000, transparency: 0.24), width: 1)
        self.shortfilmExperienceGrowingTextView.addBottomBorderWithColor(color: UIColor.init(hex: 0x000000, transparency: 0.24), width: 1)
        
        moviewExperinceYesBtn.addTarget(self, action: #selector(moviewExperienceButtonAction(_:)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDoneAction() -> Void{
        
        let getStartedVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.getstartedvc) as! GetStartedViewController
        self.navigationController?.pushViewController(getStartedVc, animated: true)
        
//        let appdelegate =  UIApplication.shared.delegate as! AppDelegate
//        appdelegate.actorDashboardApplication()
    }
    
    
    @IBAction func moviewExperienceButtonAction(_ sender : UIButton) {
        movieExperinceNoBtn.isSelected = false
        moviewExperinceYesBtn.isSelected = false
        
        if sender == movieExperinceNoBtn{
            movieExperinceNoBtn.isSelected = !movieExperinceNoBtn.isSelected
            movieExperienceGrowingTextView.isHidden = true
            movieExperienceHeightConstriant.constant = 73
        }else{
            moviewExperinceYesBtn.isSelected = !moviewExperinceYesBtn.isSelected
            movieExperienceGrowingTextView.isHidden = false
            movieExperienceHeightConstriant.constant = 150
        }
        self.viewDidLayoutSubviews()
    }
    
    @IBAction func stagePlayExperienceButtonAction(_ sender : UIButton) {
        stageplayExperinceNoBtn.isSelected = false
        stageplayExperinceYesBtn.isSelected = false
        
        if sender == stageplayExperinceNoBtn{
            stageplayExperinceNoBtn.isSelected = !stageplayExperinceNoBtn.isSelected
            stageplayExperienceGrowingTextView.isHidden = true
            stagePlayExperienceHeightConstriant.constant = 73
        }else{
            stageplayExperinceYesBtn.isSelected = !stageplayExperinceYesBtn.isSelected
            stageplayExperienceGrowingTextView.isHidden = false
            stagePlayExperienceHeightConstriant.constant = 150
        }
         self.viewDidLayoutSubviews()
    }
    
    @IBAction func actingExperienceButtonAction(_ sender : UIButton) {
        actingExperinceNoBtn.isSelected = false
        actingExperinceYesBtn.isSelected = false
        
        if sender == actingExperinceNoBtn{
            actingExperinceNoBtn.isSelected = !actingExperinceNoBtn.isSelected
            actingtraingExperienceGrowingTextView.isHidden = true
            actingtraingInstituteExperienceGrowingTextView.isHidden = true
            actingExperienceHeightConstriant.constant = 73
        }else{
            actingExperinceYesBtn.isSelected = !actingExperinceYesBtn.isSelected
            actingtraingExperienceGrowingTextView.isHidden = false
            actingtraingInstituteExperienceGrowingTextView.isHidden = false
            actingExperienceHeightConstriant.constant = 190
        }
         self.viewDidLayoutSubviews()
    }
    
    @IBAction func shortfilmExperienceButtonAction(_ sender : UIButton) {
        shortfilmExperinceNoBtn.isSelected = false
        shortfilmExperinceYesBtn.isSelected = false
        
        if sender == shortfilmExperinceNoBtn{
            shortfilmExperinceNoBtn.isSelected = !shortfilmExperinceNoBtn.isSelected
            shortfilmExperienceGrowingTextView.isHidden = true
            shortfilmExperienceHeightConstriant.constant =  73
        }else{
            shortfilmExperinceYesBtn.isSelected = !shortfilmExperinceYesBtn.isSelected
            shortfilmExperienceGrowingTextView.isHidden = false
            shortfilmExperienceHeightConstriant.constant =  150
        }
         self.viewDidLayoutSubviews()
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

