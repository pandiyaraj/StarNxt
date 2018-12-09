//
//  HelpViewController.swift
//  StarNXt
//
//  Created by Mac on 9/13/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class HelpViewController: BaseViewController {

    @IBOutlet weak var helpTableview : UITableView!
    var helpMenuArray = ["Contact us", "Terms and conditions", "Privacy policy","App info"]
    override func viewDidLoad() {
        super.viewDidLoad()
        helpTableview.register(UINib.loadNib(nibName: CellIdentifier.helpmenuTableViewCell), forCellReuseIdentifier: CellIdentifier.helpmenuTableViewCell)
        
        self.title = "Help"
        self.helpTableview.tableFooterView = UIView()
        helpTableview.separatorColor = UIColor.clear
        // Do any additional setup after loading the view.
        let hamburgerBtn = UIBarButtonItem.init(image: UIImage.init(named: "hamburger_menu"), style: .done, target: self, action:#selector(hamburgerMenuAction(_:)))
        self.navigationItem.leftBarButtonItem = hamburgerBtn
        // Do any additional setup after loading the view.
    }
    
    @objc func hamburgerMenuAction(_ sender: Any) {
        self.slideMenuController()?.openLeft()
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

extension HelpViewController : UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helpMenuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.helpmenuTableViewCell, for: indexPath) as! HelpMenuTableViewCell
        cell.titleTextLabel.text = helpMenuArray[indexPath.row]
        if indexPath.row == 0 {
            cell.descLabel?.isHidden = false
            cell.descLabel?.text = "Questions? Need help?"
        }else{
            cell.descLabel?.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 70
        }else{
            return 58
        }
    }
}
