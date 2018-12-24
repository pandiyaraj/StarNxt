//
//  DirectorAuditionListViewController.swift
//  StarNXt
//
//  Created by Mac on 9/23/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class DirectorAuditionListViewController: BaseViewController {

    @IBOutlet weak var noItemView : NoItemView!
    @IBOutlet weak var auditionBtn : UIButton!
    @IBOutlet weak var groupBtn : UIButton!
    @IBOutlet weak var auditionListTableView : UITableView!
    @IBOutlet weak var createGroupview : UIView!
    @IBOutlet weak var deleteGroupview : UIView!
    @IBOutlet weak var createNewGrpBtn : UIButton!
    @IBOutlet weak var groupNameTitleLbl : UILabel!
    
    @IBOutlet weak var lineView : UIView!
    @IBOutlet weak var viewLeadingConstraint : NSLayoutConstraint!
    
    var isPremiumAudition : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialiseUI()
        auditionBtn.sendActions(for: .touchUpInside)
        auditionListTableView.register(UINib.loadNib(nibName: CellIdentifier.directorAuditionListcell), forCellReuseIdentifier: CellIdentifier.directorAuditionListcell)
        
        auditionListTableView.register(UINib.loadNib(nibName: CellIdentifier.directorApplicationListcell), forCellReuseIdentifier: CellIdentifier.directorApplicationListcell)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
        
//        let hamburgerBtn = UIBarButtonItem.init(image: UIImage.init(named: "hamburger_menu"), style: .done, target: self, action:#selector(hamburgerMenuAction(_:)))
//        self.navigationItem.leftBarButtonItem = hamburgerBtn
        
        self.auditionListTableView.backgroundColor = UIColor.init(hex: 0xF3F7FF)
        self.view.bringSubview(toFront: self.lineView)
        // Do any additional setup after loading the view.
    }
    
    @objc func hamburgerMenuAction(_ sender: Any) {
        self.slideMenuController()?.openLeft()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    func initialiseUI() -> Void{
        self.noItemView.isHidden = true
        self.createGroupview.isHidden = true
        self.deleteGroupview.isHidden  = true
        self.createNewGrpBtn.isHidden = true
    }
    
    @IBAction func auditionBtnAction(sender : UIButton) -> Void{
        self.deselectAllButton()
        sender.isSelected = true
        
        self.createNewGrpBtn.isHidden = true
        auditionListTableView.isHidden = false
        noItemView.isHidden = true
        self.noItemView.titleLbl.text = "No premium audition posted yet"
        isPremiumAudition = true
        auditionListTableView.reloadData()
        
        UIView.animate(withDuration: 1.0) {
            self.viewLeadingConstraint.constant = 0
        }
    }
    
    @IBAction func groupBtnAction(sender : UIButton) -> Void{
          self.deselectAllButton()
        sender.isSelected = true
        auditionListTableView.isHidden = false
        noItemView.isHidden = true
//        self.createNewGrpBtn.isHidden = false
        

        self.noItemView.titleLbl.text = "No open audition posted yet"
        isPremiumAudition = false
        auditionListTableView.reloadData()
        UIView.animate(withDuration: 1.0) {
            self.viewLeadingConstraint.constant = self.lineView.width
        }
    }
    
    func deselectAllButton() -> Void {
        auditionBtn.isSelected = false
        groupBtn.isSelected = false
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

extension DirectorAuditionListViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.directorAuditionListcell, for: indexPath) as! DirectorAuditionListTableViewCell
            
            let attributedText = NSMutableAttributedString(string: "396\n", attributes: [NSAttributedStringKey.font: AppFont.getMedium(size: 16),NSAttributedStringKey.foregroundColor : UIColor.white])
            
            attributedText.append(NSAttributedString(string: "Profiles Received", attributes: [NSAttributedStringKey.font: AppFont.getRobotoRegular(size: 12),NSAttributedStringKey.foregroundColor : UIColor.white]))
            
            cell.auditionsReceivedButton.setAttributedTitle(attributedText, for: .normal)
            
            cell.auditionsReceivedButton.titleLabel?.numberOfLines = 2
        cell.auditionsReceivedButton.titleLabel?.textAlignment = .center
            cell.profileShortlistButton.titleLabel?.numberOfLines = 2
        cell.profileShortlistButton.titleLabel?.textAlignment = .center
            let attributedText1 = NSMutableAttributedString(string: "73\n", attributes: [NSAttributedStringKey.font: AppFont.getMedium(size: 16),NSAttributedStringKey.foregroundColor : UIColor.white])
            
            attributedText1.append(NSAttributedString(string: "Profiles Shortlisted", attributes: [NSAttributedStringKey.font: AppFont.getRobotoRegular(size: 12),NSAttributedStringKey.foregroundColor : UIColor.white]))
            
            cell.profileShortlistButton.setAttributedTitle(attributedText1, for: .normal)
            
            cell.profileShortlistButton.setGradientColor(color1: UIColor(red: 0.42, green: 0.07, blue: 0.80, alpha: 1), color2: UIColor(red: 0.15, green: 0.46, blue: 0.99, alpha: 1))
            cell.profileShortlistButton.tag = indexPath.row
            cell.profileShortlistButton.addTarget(self, action: #selector(onProfileShortlistAction(sender:)), for: .touchUpInside)
        
            cell.auditionsReceivedButton.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
            cell.auditionsReceivedButton.tag = indexPath.row
            cell.auditionsReceivedButton.addTarget(self, action: #selector(onProfileReceivedAction(sender:)), for: .touchUpInside)
            
            
            
            let statusAttributedText = NSMutableAttributedString(string: "Status: ", attributes: [NSAttributedStringKey.font: AppFont.getRobotoRegular(size: 12),NSAttributedStringKey.foregroundColor : UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.54)])
            if indexPath.row % 2 == 0 {
                statusAttributedText.append(NSAttributedString(string: "Active", attributes: [NSAttributedStringKey.font: AppFont.getRobotoRegular(size: 14),NSAttributedStringKey.foregroundColor : UIColor.init(hex: 0x7ed321)]))
            }else{
                statusAttributedText.append(NSAttributedString(string: "Closed", attributes: [NSAttributedStringKey.font: AppFont.getRobotoRegular(size: 12),NSAttributedStringKey.foregroundColor : UIColor.init(hex: 0xff1265)]))
            }
            cell.auditionStatusLbl.attributedText = statusAttributedText

        if isPremiumAudition == true{
            cell.auditionOpenTypeDurationLabel.isHidden = true
            cell.auditionOpenTypeDurationValueLabel.isHidden = true
            cell.auditionsReceivedButton.isHidden = false
            cell.profileShortlistButton.isHidden = false
        }else{
            cell.auditionOpenTypeDurationLabel.isHidden = false
            cell.auditionOpenTypeDurationValueLabel.isHidden = false
            cell.auditionsReceivedButton.isHidden = true
            cell.profileShortlistButton.isHidden = true
        }
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.auditiondetailvc) as! AuditionDetailViewController
        
        if isPremiumAudition {
            detailVc.auditionType = AuditionType.Personalised
        }else{
            detailVc.auditionType = AuditionType.Open
        }
        
        if indexPath.row % 2 == 0 {
            detailVc.audtionStatus = Audition_Status.Active
        }else{
            detailVc.audtionStatus = Audition_Status.Closed
        }
        self.navigationController?.pushViewController(detailVc, animated: true)
    }
    
   
}

extension DirectorAuditionListViewController {
    
    @IBAction func onCreateGroupBtnAction(sender: UIButton) -> Void{
        self.createGroupview.isHidden = false
        self.groupNameTitleLbl.text = "Create New Group"
    }
    
    @IBAction func onCancelGroupAction(sender : UIButton) -> Void{
        self.createGroupview.isHidden = true
    }
    
    @IBAction func onCreateGroupAction(sender : UIButton) -> Void{
        self.createGroupview.isHidden = true
    }
    
    @IBAction func onDeleteCancelAction(sender : UIButton) -> Void{
        self.deleteGroupview.isHidden = true
    }
    
    @IBAction func onDeleteAction(sender : UIButton) -> Void{
        self.deleteGroupview.isHidden = true
    }
    
    @objc func moreBtnAction(sender : UIButton) -> Void{
        let tag = sender.tag
        let actionSheet = UIAlertController.init(title: "", message: "Edit Group Name", preferredStyle: .actionSheet)
        
        let editAction = UIAlertAction.init(title: "Rename", style: .default) { (action) in
           
            self.createGroupview.isHidden = false
            self.groupNameTitleLbl.text = "Rename Group"
        }
        
        let deleteAction = UIAlertAction.init(title: "Delete Group", style: .destructive) { (action) in
            
            self.deleteGroupview.isHidden = false
        }
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        actionSheet.addAction(editAction)
        actionSheet.addAction(deleteAction)
        actionSheet.addAction(cancelAction)
        if DeviceType.IS_IPAD {
            
        }else{
            self.present(actionSheet, animated: true, completion: nil)
        }
    }
    
}

extension DirectorAuditionListViewController{
    @objc func onProfileReceivedAction(sender : UIButton) -> Void{
        let applicaitonDetailVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.directorApplicationGrooupvc) as! DirectorApplicationGroupController
        self.navigationController?.pushViewController(applicaitonDetailVc, animated: true)
    }
    
    @objc func onProfileShortlistAction(sender : UIButton) -> Void{
        let applicaitonDetailVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.directorApplicationGrooupvc) as! DirectorApplicationGroupController
        applicaitonDetailVc.isFromShortList = true
        self.navigationController?.pushViewController(applicaitonDetailVc, animated: true)
    }
}
