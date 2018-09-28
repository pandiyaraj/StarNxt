//
//  CreateProfileViewController+CollectionViewDelegate.swift
//  StarNXt
//
//  Created by Mac on 9/20/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

extension CreateProfileViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == knownLanguageCollectionView{
            return self.knownLanguageArray.count
        }else if collectionView == prefferedLanguageCollectionView{
            return self.preferredLanguageArray.count
        }else if collectionView == auditionPrefernceCollectionView{
            return self.audtionPreferenceArray.count
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.profilecollectioncell, for: indexPath) as! ProfileSelectionViewCell
        
        if collectionView == knownLanguageCollectionView{
            cell.collectionBtn.setTitle(self.knownLanguageArray[indexPath.row], for: .normal)
            cell.collectionBtn.addTarget(self, action: #selector(knownLanguageAction(sender:)), for: .touchUpInside)
        }else if collectionView == prefferedLanguageCollectionView {
            cell.collectionBtn.setTitle(self.preferredLanguageArray[indexPath.row], for: .normal)
             cell.collectionBtn.addTarget(self, action: #selector(preferredLangugeAction(sender:)), for: .touchUpInside)
        }else if collectionView == auditionPrefernceCollectionView {
            cell.collectionBtn.setTitle(self.audtionPreferenceArray[indexPath.row], for: .normal)
             cell.collectionBtn.addTarget(self, action: #selector(audtionPrefrenceAction(sender:)), for: .touchUpInside)
        }else{
            cell.collectionBtn.setTitle("Tamil", for: .normal)
        }
        
        cell.collectionBtn.tag = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var titleStr = "Tamil"
        if collectionView == knownLanguageCollectionView{
            titleStr = knownLanguageArray[indexPath.row]
        }else if collectionView == prefferedLanguageCollectionView{
           titleStr = preferredLanguageArray[indexPath.row]
        }else if collectionView == auditionPrefernceCollectionView{
           titleStr = audtionPreferenceArray[indexPath.row]
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
            let profilecell  =  cell as! ProfileSelectionViewCell
            profilecell.collectionBtn.isSelected = false
        }
        sender.isSelected = !sender.isSelected
    }
    
    @objc func preferredLangugeAction(sender : UIButton) {
        
    }
    
    @objc func audtionPrefrenceAction(sender : UIButton) {
        
    }
}
