//
//  PersonalisedViewController.swift
//  StarNXt
//
//  Created by Mac on 9/22/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class PersonalisedViewController: UIViewController {

    @IBOutlet weak var projectListCollectionView : UICollectionView!
    @IBOutlet weak var knownLanguageCollectionView : UICollectionView!
    @IBOutlet weak var experienceListView : UITableView!
    @IBOutlet weak var measurmentListView : UITableView!
    

    @IBOutlet weak var projectListCollectionHeightConstraint : NSLayoutConstraint!
    @IBOutlet weak var LanguageCollectionViewConstraint : NSLayoutConstraint!
    @IBOutlet weak var experienceTableviewHeightConstraint : NSLayoutConstraint!
    @IBOutlet weak var measurementHeightConstraint : NSLayoutConstraint!


    var projectListArray = ["Feature Film", "Web Series", "Serial", "Short Film", "Advertisement", "Modeling","Stage Play","Tele Film","Pilot Movie","Events"]
    var knownLanguageArray = ["Tamil", "Telugu", "Kannada", "Malayalam", "Hindi", "Marathi","Bengali", "Bhojpuri", "Punjabi", "Gujarati", "English"]
    var experienceListArray = ["Movie Experience", "Acting Training", "Stage Play Experience", "Short Films / Other Experience", "Freshers"]
    var measurementListArray = ["Height", "Body Type", "Skin Color", "Hair Type", "Eye Color"]

    var selectedMeasurementStr : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
        self.updateHeightConstraints()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        
        
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 0.42, green: 0.07, blue: 0.80, alpha: 1), color2: UIColor(red: 0.15, green: 0.46, blue: 0.99, alpha: 1))
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func registerCells() -> Void {
        projectListCollectionView.register(UINib.loadNib(nibName: CellIdentifier.persolnalizedAudtioncollectioncell), forCellWithReuseIdentifier: CellIdentifier.persolnalizedAudtioncollectioncell)
        
        knownLanguageCollectionView.register(UINib.loadNib(nibName: CellIdentifier.persolnalizedAudtioncollectioncell), forCellWithReuseIdentifier: CellIdentifier.persolnalizedAudtioncollectioncell)
      
        experienceListView.register(UINib.loadNib(nibName: CellIdentifier.experiencecell), forCellReuseIdentifier: CellIdentifier.experiencecell)
        measurmentListView.register(UINib.loadNib(nibName: CellIdentifier.measurementcell), forCellReuseIdentifier: CellIdentifier.measurementcell)
    }
    
    func updateHeightConstraints() -> Void{
        projectListCollectionHeightConstraint.constant = CGFloat(((projectListArray.count / 2 ) + 1 ) * 32)
        LanguageCollectionViewConstraint.constant = CGFloat(((knownLanguageArray.count / 2 ) + 1 ) * 32)
        experienceTableviewHeightConstraint.constant = CGFloat(experienceListArray.count * 60)
        measurementHeightConstraint.constant = CGFloat(measurementListArray.count * 60)

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
