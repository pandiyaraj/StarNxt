//
//  PortfolioViewController.swift
//  StarNXt
//
//  Created by Mac on 9/16/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController {

    @IBOutlet weak var portfolioCollectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        portfolioCollectionView.register(UINib.loadNib(nibName: CellIdentifier.portfolioCell), forCellWithReuseIdentifier: CellIdentifier.portfolioCell)
        
        self.title = "Portfolio"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain
            , target: self, action: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func onNextAction() -> Void{
        let experienceVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.experiencevc) as! ExperienceSelectionViewController
        self.navigationController?.pushViewController(experienceVc, animated: true)
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

extension PortfolioViewController : UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.portfolioCell, for: indexPath) as! PortfolioCollectionViewCell
        if indexPath.row == 5{
            cell.addPhotoView.isHidden = false
        }else{
            cell.addPhotoView.isHidden = true
        }
//        cell.profileImage.image =
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let numberOfItemsPerRow: Int = 3
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfItemsPerRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfItemsPerRow))
        return CGSize(width: size, height: size)
    }
}
