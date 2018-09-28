//
//  AuditionDetailViewController.swift
//  StarNXt
//
//  Created by Mac on 9/11/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit


class AuditionDetailViewController: UIViewController {

    @IBOutlet weak var listTableView : UITableView!
    @IBOutlet weak var applyBtn : UIButton!
    @IBOutlet weak var tableviewBottomConstraint : NSLayoutConstraint!
    var isFromPersonalised : Bool = false
    
    var userRole : String = ""
    
    var audtionStatus : String = ""
    var auditionType : String = ""
    var audtionDetails = [String : String]()
    var selectedAudition = AuditionModel()
    var titleKeys = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadDict()
        self.updateUI()
        listTableView.register(UINib.loadNib(nibName: CellIdentifier.audtionDetailTableviewcell), forCellReuseIdentifier: CellIdentifier.audtionDetailTableviewcell)

        // Do any additional setup after loading the view.
    }
    
    func loadDict() -> Void{
        if auditionType == AuditionType.Open{
            titleKeys = ["Director","Project","Title","Language","Production","Audition Date","Audition Address","Landmark","Description","Contact Person","Phone Number"]
            audtionDetails = [titleKeys[0]:selectedAudition.director,titleKeys[1]:selectedAudition.project,titleKeys[2]:selectedAudition.auditionTitle,titleKeys[3]:selectedAudition.language,titleKeys[4]:selectedAudition.production,titleKeys[5]:selectedAudition.shootDate,titleKeys[6]:selectedAudition.shootLocation,titleKeys[7]:selectedAudition.audtionLandMark,titleKeys[8]:selectedAudition.auditionDescription,titleKeys[9]:selectedAudition.contactPerson,titleKeys[10]:selectedAudition.contactPersonNumber]

        }else{
            titleKeys = ["Director","Project","Title","Language","Production","ShootDate","Shoot Location","Description","AuditionPosted","Last date to apply"]
            applyBtn.isHidden = false
            audtionDetails = [titleKeys[0]:selectedAudition.director,titleKeys[1]:selectedAudition.project,titleKeys[2]:selectedAudition.auditionTitle,titleKeys[3]:selectedAudition.language,titleKeys[4]:selectedAudition.production,titleKeys[5]:selectedAudition.shootDate,titleKeys[6]:selectedAudition.shootLocation,titleKeys[7]:selectedAudition.auditionDescription,titleKeys[8]:selectedAudition.audtionPostedDate,titleKeys[9]:selectedAudition.auditionLastDateApply]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() -> Void {
        if auditionType == AuditionType.Open{
            applyBtn.isHidden = true
            tableviewBottomConstraint.constant = 0
        }else {
            tableviewBottomConstraint.constant = 84
            applyBtn.isHidden = false
            if audtionStatus == Audition_Status.Active{
                applyBtn.setTitle("Apply", for: .normal)
                applyBtn.backgroundColor = UIColor.init(hex: 0xFF1462)
            }else if audtionStatus == Audition_Status.Applied{
                applyBtn.setTitle("Applied", for: .normal)
                applyBtn.backgroundColor = UIColor.init(hex: 0x808080)
            }else if audtionStatus == Audition_Status.Closed{
                applyBtn.setTitle("Closed", for: .normal)
                applyBtn.backgroundColor = UIColor.init(hex: 0x808080)
            }
        }
       
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

extension AuditionDetailViewController : UITableViewDataSource, UITableViewDelegate{
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
        return 70
    }
    
    
}
