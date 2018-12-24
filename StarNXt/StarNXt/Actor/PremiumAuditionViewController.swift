//
//  PremiumAuditionViewController.swift
//  StarNXt
//
//  Created by Mac on 12/19/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class PremiumAuditionViewController: UIViewController {

    @IBOutlet weak var listTableView : UITableView!
    
    var audtionStatus : String = ""
    var auditionType : String = ""
    var audtionDetails = [String : String]()
    var selectedAudition = AuditionModel()
    var titleKeys = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.register(UINib.loadNib(nibName: CellIdentifier.audtionDetailTableviewcell), forCellReuseIdentifier: CellIdentifier.audtionDetailTableviewcell)
        listTableView.tableFooterView = UIView()
        
        self.title = "Test"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
        
        titleKeys = ["Director","Project","Title","Language","Production","ShootDate","Shoot Location","Description","AuditionPosted","Last date to apply"]
        audtionDetails = [titleKeys[0]:selectedAudition.director,titleKeys[1]:selectedAudition.project,titleKeys[2]:selectedAudition.auditionTitle,titleKeys[3]:selectedAudition.language,titleKeys[4]:selectedAudition.production,titleKeys[5]:selectedAudition.shootDate,titleKeys[6]:selectedAudition.shootLocation,titleKeys[7]:selectedAudition.auditionDescription,titleKeys[8]:selectedAudition.audtionPostedDate,titleKeys[9]:selectedAudition.auditionLastDateApply]
        // Do any additional setup after loading the view.
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
extension PremiumAuditionViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return audtionDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.audtionDetailTableviewcell, for: indexPath) as! AuditionDetailTableViewCell
        let key = titleKeys[indexPath.row]
        cell.titleLabel.text = key
        cell.detailLabel.text = audtionDetails[key]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
}
