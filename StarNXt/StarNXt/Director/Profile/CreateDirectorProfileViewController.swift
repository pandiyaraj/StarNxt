//
//  CreateDirectorProfileViewController.swift
//  StarNXt
//
//  Created by Mac on 9/21/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class CreateDirectorProfileViewController: BaseViewController {

    @IBOutlet weak var directorListCollectionView : UICollectionView!
    @IBOutlet weak var directorListCollectionHeightConstraint : NSLayoutConstraint!
    var listArray = ["Director", "Co Director", "Associate Director", "Assistant Director", "Casting Director", "Serial Director","Short film Director"]

    override func viewDidLoad() {
        super.viewDidLoad()
        directorListCollectionView.register(UINib.loadNib(nibName: CellIdentifier.profilecollectioncell), forCellWithReuseIdentifier: CellIdentifier.profilecollectioncell)
        self.updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() -> Void {
        directorListCollectionHeightConstraint.constant = CGFloat(((listArray.count / 2 ) + 2 ) * 32)
    }
    
    
    @IBAction func getStartedAction() -> Void{
        let getstartedVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.getstartedvc) as!  GetStartedViewController
        self.navigationController?.pushViewController(getstartedVc, animated: true)

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
