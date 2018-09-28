//
//  AuditionViewController.swift
//  StarNXt
//
//  Created by Mac on 9/10/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class AuditionViewController: UIViewController {

    @IBOutlet weak var listtableview : UITableView!
    @IBOutlet weak var segmentItem : UISegmentedControl!
    @IBOutlet weak var topView : UIView!
    @IBOutlet weak var activeBtn : UIButton!
    @IBOutlet weak var closedBtn : UIButton!
    @IBOutlet weak var appliedBtn : UIButton!
    @IBOutlet weak var indicatorViewLeadingConstraint : NSLayoutConstraint!
    @IBOutlet weak var indicatorViewTrailingConstraint : NSLayoutConstraint!

    
    var isOpenAudition : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listtableview.register(UINib.loadNib(nibName: CellIdentifier.audtionTableviewcell), forCellReuseIdentifier: CellIdentifier.audtionTableviewcell)
        if isOpenAudition {
            appliedBtn.isHidden = true
        }else{
            appliedBtn.isHidden = false
        }
        
        activeBtn.sendActions(for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func topViewBtnActions(_ sender: UIButton){
        let selectedBtnTag = sender.tag
        self.deselectAllButtons()
        sender.isSelected = true
//        indicatorViewLeadingConstraint.constant = sender.frame.origin.x
//        indicatorViewTrailingConstraint.constant = sender.frame.width
    
//        switch selectedBtnTag {
//        case 10:
//            indicatorViewLeadingConstraint.constant = sender.frame.origin.x
//            break;
//        case 11:
//            break;
//        case 12:
//            break;
//        default:
//            
//            
//        }
    }
    
    func deselectAllButtons() -> Void {
        activeBtn.isSelected = false
        closedBtn.isSelected = false
        appliedBtn.isSelected = false
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

extension AuditionViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.audtionTableviewcell, for: indexPath) as! AuditionTableViewCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let auditionDetail = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.auditiondetailvc) as! AuditionDetailViewController
        if activeBtn.isSelected {
            auditionDetail.audtionStatus = Audition_Status.Active
        }else if closedBtn.isSelected{
            auditionDetail.audtionStatus = Audition_Status.Closed
        }else{
            auditionDetail.audtionStatus = Audition_Status.Applied
        }
        auditionDetail.auditionType = self.isOpenAudition ? AuditionType.Open : AuditionType.Personalised
        self.navigationController?.pushViewController(auditionDetail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
}
