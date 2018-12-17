//
//  ExperienceSelectionViewController.swift
//  StarNXt
//
//  Created by Mac on 9/16/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit
import GrowingTextView

class ExperienceSelectionViewController: UIViewController {

    @IBOutlet weak var movieExperienceGrowingTextView : GrowingTextView!
    @IBOutlet weak var stageplayExperienceGrowingTextView : GrowingTextView!
    @IBOutlet weak var actingtraingExperienceGrowingTextView : GrowingTextView!
    @IBOutlet weak var shortfilmExperienceGrowingTextView : GrowingTextView!
    
    @IBOutlet weak var movieExperinceNoBtn : UIButton!
    @IBOutlet weak var moviewExperinceYesBtn : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        self.title = "Experience"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
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
        }else{
            moviewExperinceYesBtn.isSelected = !moviewExperinceYesBtn.isSelected
            movieExperienceGrowingTextView.isHidden = false
        }
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

