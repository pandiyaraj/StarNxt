//
//  PersonalisedViewController+TableViewDelegate.swift
//  StarNXt
//
//  Created by Mac on 9/22/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

extension PersonalisedViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == measurmentListView{
            return measurementListArray.count
        }else if tableView == experienceListView{
            return experienceListArray.count
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == experienceListView{
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.experiencecell, for: indexPath) as! ExperienceTableViewCell
            cell.checkBtn.tag = indexPath.row
            cell.checkBtn.addTarget(self, action: #selector(onCheckBoxAction(sender:)), for: .touchUpInside)
            cell.titlelbl.text = self.experienceListArray[indexPath.row]
            return cell
        }else if tableView == measurmentListView{
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.measurementcell, for: indexPath) as! MeasurementTableViewCell
            cell.measurementHeightView.isHidden = true
            if indexPath.row == 0 {
                cell.measurementHeightView.isHidden = false
                
            }else{
                cell.titleLbl.text = self.measurementListArray[indexPath.row]
                cell.detailTitleLbl.text = selectedMeasurementStr
            }
            return cell

        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == measurmentListView{
            if indexPath.row == 0 {
                return 75
            }else{
                return 50
            }
        }else{
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == measurmentListView {
            if indexPath.row == 0 {
                
            }else{
                
            }
        }else{
            let cell = tableView.cellForRow(at: indexPath) as! ExperienceTableViewCell
            self.onCheckBoxAction(sender: cell.checkBtn)
        }
    }
    
    @objc func onCheckBoxAction(sender : UIButton) -> Void{
        sender.isSelected = !sender.isSelected
    }
    
    
}
