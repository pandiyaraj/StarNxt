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
    
    var isAudition : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialiseUI()
        auditionBtn.sendActions(for: .touchUpInside)
        auditionListTableView.register(UINib.loadNib(nibName: CellIdentifier.directorAuditionListcell), forCellReuseIdentifier: CellIdentifier.directorAuditionListcell)
        
        auditionListTableView.register(UINib.loadNib(nibName: CellIdentifier.directorApplicationListcell), forCellReuseIdentifier: CellIdentifier.directorApplicationListcell)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
        
        let hamburgerBtn = UIBarButtonItem.init(image: UIImage.init(named: "hamburger_menu"), style: .done, target: self, action:#selector(hamburgerMenuAction(_:)))
        self.navigationItem.leftBarButtonItem = hamburgerBtn
        
        self.auditionListTableView.backgroundColor = UIColor.init(hex: 0xF3F7FF)

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
        self.noItemView.titleLbl.text = "No audition posted yet"
        isAudition = true
        auditionListTableView.reloadData()
    }
    
    @IBAction func groupBtnAction(sender : UIButton) -> Void{
          self.deselectAllButton()
        sender.isSelected = true
        auditionListTableView.isHidden = false
        noItemView.isHidden = true
        self.createNewGrpBtn.isHidden = false
        

        self.noItemView.titleLbl.text = "No group created yet"
        isAudition = false
        auditionListTableView.reloadData()
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
        if isAudition == true{
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.directorAuditionListcell, for: indexPath) as! DirectorAuditionListTableViewCell
        return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.directorApplicationListcell, for: indexPath) as! ApplicationTableViewCell
            cell.moreBtn.tag = indexPath.row
            if indexPath.row % 2 == 0 {
                cell.moreBtn.isHidden = false
            }else{
                cell.moreBtn.isHidden = true
            }
            
            cell.applicationStatusLbl.text = "Auditions"
            cell.newProfileLbl.text = "397 Profiles Received"
            cell.moreBtn.addTarget(self, action: #selector(moreBtnAction(sender:)), for: .touchUpInside)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isAudition{
        return 235
        }else{
            return 160
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isAudition {
            let detailVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.auditiondetailvc) as! AuditionDetailViewController
            detailVc.userRole = UserRole.Director
            if indexPath.row % 2 == 0 {
            detailVc.auditionType = AuditionType.Open
            
            }else{
                detailVc.auditionType = AuditionType.Personalised
            }
            self.navigationController?.pushViewController(detailVc, animated: true)
        }else{
            let detailVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.directorAuditionGroupVc) as! AuditionGroupDetailViewController
            self.navigationController?.pushViewController(detailVc, animated: true)
        }
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
