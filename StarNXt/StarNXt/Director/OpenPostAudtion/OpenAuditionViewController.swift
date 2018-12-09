//
//  OpenAuditionViewController.swift
//  StarNXt
//
//  Created by Mac on 9/23/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class OpenAuditionViewController: BaseViewController {

    @IBOutlet weak var projectListCollectionView : UICollectionView!
    @IBOutlet weak var knownLanguageCollectionView : UICollectionView!
    @IBOutlet weak var projectListCollectionHeightConstraint : NSLayoutConstraint!
    @IBOutlet weak var LanguageCollectionViewConstraint : NSLayoutConstraint!
    
    var projectListArray = ["Feature Film", "Web Series", "Serial", "Short Film", "Advertisement", "Modeling","Stage Play","Tele Film","Pilot Movie","Events"]
    var knownLanguageArray = ["Tamil", "Telugu", "Kannada", "Malayalam", "Hindi", "Marathi","Bengali", "Bhojpuri", "Punjabi", "Gujarati", "English"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
        // Do any additional setup after loading the view.
    }
    

    func registerCell() -> Void{
        projectListCollectionView.register(UINib.loadNib(nibName: CellIdentifier.profilecollectioncell), forCellWithReuseIdentifier: CellIdentifier.profilecollectioncell)
        
        knownLanguageCollectionView.register(UINib.loadNib(nibName: CellIdentifier.profilecollectioncell), forCellWithReuseIdentifier: CellIdentifier.profilecollectioncell)
        
        self.updateHeight()

    }
    
    func updateHeight() -> Void{
        projectListCollectionHeightConstraint.constant = CGFloat(((projectListArray.count / 2 ) + 1 ) * 32)
        LanguageCollectionViewConstraint.constant = CGFloat(((knownLanguageArray.count / 2 ) + 1 ) * 32)
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
