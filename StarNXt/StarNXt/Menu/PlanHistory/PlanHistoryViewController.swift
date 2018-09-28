//
//  PlanHistoryViewController.swift
//  StarNXt
//
//  Created by Mac on 9/14/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class PlanHistoryViewController: UIViewController {

    @IBOutlet weak var historyTableview : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTableview.register(UINib.loadNib(nibName: CellIdentifier.planHistoryCell), forCellReuseIdentifier: CellIdentifier.planHistoryCell)
        historyTableview.tableFooterView = UIView()
        historyTableview.sectionHeaderHeight = 40

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension PlanHistoryViewController : UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1

        }else{
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.planHistoryCell, for: indexPath) as! PlanHistoryTableViewCell
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 75
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect.zero)
        let label = UILabel.init(frame: CGRect(x: 15, y: 10, width: 200, height: 21))
        if section == 0{
            label.text = "Current plan"
        }else{
            label.text = "History"
        }
        label.textColor = UIColor.init(hex: 0x303030)
        label.font = AppFont.getRobotoMedium(size: 18)
        view.addSubview(label)
        return view
        
    }
    
}
