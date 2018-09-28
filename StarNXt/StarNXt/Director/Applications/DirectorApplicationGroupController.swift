//
//  DirectorApplicationGroupController.swift
//  StarNXt
//
//  Created by Mac on 9/25/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class DirectorApplicationGroupController: UIViewController {

    
    @IBOutlet weak var noItemView : NoItemView!
    @IBOutlet weak var groupListView : UITableView!
    @IBOutlet weak var removeProfileView : UIView!
    
    var isFromShortList : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        noItemView.titleLbl.text = "No Profiles received yet"
        self.removeProfileView.isHidden = true
        // Do any additional setup after loading the view.
        groupListView.register(UINib.loadNib(nibName: CellIdentifier.directorGroupApplicationCell), forCellReuseIdentifier: CellIdentifier.directorGroupApplicationCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
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

extension DirectorApplicationGroupController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            CellIdentifier.directorGroupApplicationCell, for: indexPath) as! ApplicationGroupCell
        if self.isFromShortList == true {
            cell.shortListBtn.isHidden = true
            cell.removeBtn.isHidden = false
            cell.shortListLabel.text = "Remove"
            cell.removeBtn.tag  = indexPath.row
            cell.removeBtn.addTarget(self, action: #selector(removeAction(sender:)), for: .touchUpInside)
            
        }else{
        cell.removeBtn.isHidden = true
        if indexPath.row % 2 == 0{
            cell.shortListBtn.isHidden = true
            cell.shortListLabel.text = "Shortlisted"
        }else{
            cell.shortListBtn.isHidden = false
            cell.shortListLabel.text = "Shortlist"
        }
            cell.shortListBtn.addTarget(self, action: #selector(onShortListAction(sender:)), for: .touchUpInside)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFromShortList == false{
        let detailVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.directorApplicationDetailVc) as! ApplicaitonDetailViewController
        self.navigationController?.pushViewController(detailVc, animated: true)
        }
    }
   
}

extension DirectorApplicationGroupController {
    
    @objc func onShortListAction(sender : UIButton) -> Void{
        let tag = sender.tag
        
    }
    
    @objc func removeAction(sender : UIButton) -> Void{
        self.removeProfileView.isHidden = false
        
    }
    
    @IBAction func onCancelAction(sender : UIButton) -> Void{
        self.removeProfileView.isHidden = true
    }
    
    @IBAction func onDeleteAction(sender : UIButton) -> Void{
        self.removeProfileView.isHidden = true
    }
}
