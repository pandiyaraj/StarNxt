//
//  PersonalisedViewController+CollectionviewDelegate.swift
//  StarNXt
//
//  Created by Mac on 9/22/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

extension PersonalisedViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == knownLanguageCollectionView{
            return self.knownLanguageArray.count
        }else if collectionView == projectListCollectionView{
            return self.projectListArray.count
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.persolnalizedAudtioncollectioncell, for: indexPath) as! PersonlisedAudtionCollectionViewCell
        
        if collectionView == knownLanguageCollectionView{
            cell.collecionBtn.setTitle(self.knownLanguageArray[indexPath.row], for: .normal)
            cell.collecionBtn.addTarget(self, action: #selector(knownLanguageAction(sender:)), for: .touchUpInside)
        }else if collectionView == projectListCollectionView {
            cell.collecionBtn.setTitle(self.projectListArray[indexPath.row], for: .normal)
            cell.collecionBtn.addTarget(self, action: #selector(projectSelectAction(sender:)), for: .touchUpInside)
        }else{
            cell.collecionBtn.setTitle("Tamil", for: .normal)
        }
        
        cell.collecionBtn.tag = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var titleStr = "Tamil"
        if collectionView == knownLanguageCollectionView{
            titleStr = knownLanguageArray[indexPath.row]
        }else if collectionView == projectListCollectionView{
            titleStr = projectListArray[indexPath.row]
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
    
    @objc func knownLanguageAction(sender : UIButton) {
        for cell in knownLanguageCollectionView.visibleCells{
            let profilecell  =  cell as! PersonlisedAudtionCollectionViewCell
            profilecell.collecionBtn.isSelected = false
        }
        sender.isSelected = !sender.isSelected
    }
    
    @objc func projectSelectAction(sender : UIButton) {
        for cell in projectListCollectionView.visibleCells{
            let profilecell  =  cell as! PersonlisedAudtionCollectionViewCell
            profilecell.collecionBtn.isSelected = false
        }
        sender.isSelected = !sender.isSelected
    }
    
    @objc func audtionPrefrenceAction(sender : UIButton) {
        
    }
}
