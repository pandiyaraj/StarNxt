//
//  DirectorShortListViewController+DelegateClasses.swift
//  StarNXt
//
//  Created by Mac on 9/27/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit
import OnlyPictures
extension DirectorShortListViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.directorApplicationListcell, for: indexPath) as! ApplicationTableViewCell
        cell.applicationStatusLbl.text = "Profiles Shortlisted"
        cell.newProfileLbl.isHidden = true
        cell.pictureView.isHidden = false
        cell.pictureView.dataSource = self
        cell.pictureView.delegate = self
        cell.pictureView.gap = 20
        cell.moreBtn.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let applicaitonDetailVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.directorApplicationGrooupvc) as! DirectorApplicationGroupController
        applicaitonDetailVc.isFromShortList = true
        self.navigationController?.pushViewController(applicaitonDetailVc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}


extension DirectorShortListViewController : OnlyPicturesDelegate{
    func pictureView(_ imageView: UIImageView, didSelectAt index: Int) {
        print(index)
    }
    
    
}

extension DirectorShortListViewController : OnlyPicturesDataSource{
    func numberOfPictures() -> Int {
        return 6
    }
    


    func visiblePictures() -> Int {
        return 6
    }
    
    func pictureViews(index: Int) -> UIImage {
        return UIImage.init(named: "noImage")!
    }
    
    func pictureViews(_ imageView: UIImageView, index: Int) {
        
        // Use 'index' to receive specific url from your collection. It's similar to indexPath.row in UITableView.
        imageView.image = UIImage.init(named: "noImage")
    }
}
