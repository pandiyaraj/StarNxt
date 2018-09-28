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
        var stringSt = "Test"
        stringSt.getWidth(withConstraintedHeight: 32, font: UIFont.systemFont(ofSize: 16))
        
        portfolioCollectionView.register(UINib.loadNib(nibName: CellIdentifier.portfolioCell), forCellWithReuseIdentifier: CellIdentifier.portfolioCell)
        // Do any additional setup after loading the view.
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
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.portfolioCell, for: indexPath) as! PortfolioCollectionViewCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let numberOfItemsPerRow: Int = 4
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfItemsPerRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfItemsPerRow))
        return CGSize(width: size, height: size)
    }
}
