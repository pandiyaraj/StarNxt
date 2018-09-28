//
//  CreateDirectorProfileViewController+CollectionviewdDelegate.swift
//  StarNXt
//
//  Created by Mac on 9/21/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

extension CreateDirectorProfileViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == directorListCollectionView{
            return self.listArray.count
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.profilecollectioncell, for: indexPath) as! ProfileSelectionViewCell
        
        if collectionView == directorListCollectionView{
            cell.collectionBtn.setTitle(self.listArray[indexPath.row], for: .normal)
            cell.collectionBtn.addTarget(self, action: #selector(chooseAction(sender:)), for: .touchUpInside)
        }else{
            cell.collectionBtn.setTitle("Director", for: .normal)
        }
        
        cell.collectionBtn.tag = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var titleStr = "Director"
        if collectionView == directorListCollectionView{
            titleStr = listArray[indexPath.row]
        }
        var size = titleStr.getWidth(withConstraintedHeight: 32, font: AppFont.getRegular(size: 15))
        print("Title Str == \(titleStr) and previous size \(size)")
        if size > 20 && size < 40 {
            size = 70
        }else if size >= 40 && size <= 60{
            size = 90
        }else{
            size = size + 40
        }
        print("Title Str == \(titleStr) and size \(size)")
        return CGSize(width: size, height: 32)
    }
    
    
    
    //MARK: Button actions
    
    @objc func chooseAction(sender : UIButton) {
        for cell in directorListCollectionView.visibleCells{
            let profilecell  =  cell as! ProfileSelectionViewCell
            profilecell.collectionBtn.isSelected = false
        }
        sender.isSelected = !sender.isSelected
    }
}
