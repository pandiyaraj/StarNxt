//
//  AuditionViewController.swift
//  StarNXt
//
//  Created by Mac on 9/10/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class AuditionViewController: BaseViewController {

    @IBOutlet weak var listtableview : UITableView!
    @IBOutlet weak var segmentItem : UISegmentedControl!
    @IBOutlet weak var topView : UIView!
    @IBOutlet weak var activeBtn : UIButton!
    @IBOutlet weak var appliedBtn : UIButton!
    @IBOutlet weak var indicatorViewLeadingConstraint : NSLayoutConstraint!
    @IBOutlet weak var tableviewTopConstraint : NSLayoutConstraint!
    @IBOutlet weak var topBtnView : UIStackView!
    
    @IBOutlet weak var lineView : UIView!

    
    var isOpenAudition : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listtableview.register(UINib.loadNib(nibName: CellIdentifier.audtionTableviewcell), forCellReuseIdentifier: CellIdentifier.audtionTableviewcell)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: " ", style: .plain, target: self, action: nil)
        self.view.backgroundColor = UIColor.init(red: 243.0/255.0, green: 247.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        
        listtableview.backgroundColor = UIColor.init(hex: 0xF3F7FF)
        
        if isOpenAudition {
            self.title = "Open Auditions"
            tableviewTopConstraint.constant = 20
            self.topBtnView.isHidden = true
            self.topView.backgroundColor = UIColor.init(hex: 0xF3F7FF)
            self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
          
            }else{
            self.title = "Premium Auditions"
            self.topBtnView.isHidden = false
            tableviewTopConstraint.constant = 78
            self.topView.backgroundColor = UIColor.init(hex: 0x212121)
            
            self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 0.42, green: 0.07, blue: 0.80, alpha: 1), color2: UIColor(red: 0.15, green: 0.46, blue: 0.99, alpha: 1))
        
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
        UIView.animate(withDuration: 1.0) {
            self.indicatorViewLeadingConstraint.constant = self.lineView.width * CGFloat(sender.tag)
        }
    }
    
    func deselectAllButtons() -> Void {
        activeBtn.isSelected = false
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
        
        let statusAttributedText = NSMutableAttributedString(string: "Status: ", attributes: [NSAttributedStringKey.font: AppFont.getRobotoRegular(size: 12),NSAttributedStringKey.foregroundColor : UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.54)])
        if indexPath.row % 2 == 0 {
            statusAttributedText.append(NSAttributedString(string: "Active", attributes: [NSAttributedStringKey.font: AppFont.getRobotoRegular(size: 14),NSAttributedStringKey.foregroundColor : UIColor.init(hex: 0x7ed321)]))
        }else{
            statusAttributedText.append(NSAttributedString(string: "Closed", attributes: [NSAttributedStringKey.font: AppFont.getRobotoRegular(size: 12),NSAttributedStringKey.foregroundColor : UIColor.init(hex: 0xff1265)]))
        }
        cell.audtionStatusLbl.attributedText = statusAttributedText
        
        if isOpenAudition{
            cell.lastDateKeyLbl.text = "Audition date"
            cell.lastDateLbl.text = "20-12-18 - 29-12-18"

        }else{
            cell.lastDateKeyLbl.text = "Last date"
            cell.lastDateLbl.text = "29-12-18"
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let cell = listtableview.cellForRow(at: indexPath) as! AuditionTableViewCell
        let isActive = cell.audtionStatusLbl.text?.containsIgnoringCase("Active") ?? false
        if !isOpenAudition && activeBtn.isSelected && isActive {
            let auditionDetail = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.premiumauditiondetailvc) as! PremiumAuditionViewController
            self.navigationController?.pushViewController(auditionDetail, animated: true)
        }else{
            let auditionDetail = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.auditiondetailvc) as! AuditionDetailViewController
            if isActive{
                if topBtnView.isHidden{
                    
                }else{
                    if activeBtn.isSelected{
                        auditionDetail.audtionStatus = Audition_Status.Active
                    }else if appliedBtn.isSelected{
                        auditionDetail.audtionStatus = Audition_Status.Applied
                    }
                }
                
            }else{
                auditionDetail.audtionStatus = Audition_Status.Closed
            }
            
            
            auditionDetail.auditionType = self.isOpenAudition ? AuditionType.Open : AuditionType.Personalised
            self.navigationController?.pushViewController(auditionDetail, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 199
    }
}
