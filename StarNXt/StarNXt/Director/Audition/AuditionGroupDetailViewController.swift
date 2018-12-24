//
//  AuditionGroupDetailViewController.swift
//  StarNXt
//
//  Created by Mac on 9/29/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class AuditionGroupDetailViewController: UIViewController {

    @IBOutlet weak var auditionListTableView : UITableView!
    @IBOutlet weak var noItemView : NoItemView!
    override func viewDidLoad() {
        super.viewDidLoad()
        noItemView.titleLbl.text = "No profiles added yet"
        auditionListTableView.register(UINib.loadNib(nibName: CellIdentifier.directorAuditionListcell), forCellReuseIdentifier: CellIdentifier.directorAuditionListcell)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))

        // Do any additional setup after loading the view.
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

extension AuditionGroupDetailViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.directorAuditionListcell, for: indexPath) as! DirectorAuditionListTableViewCell
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.auditiondetailvc) as! AuditionDetailViewController
        if indexPath.row % 2 == 0 {
            detailVc.auditionType = AuditionType.Open
            
        }else{
            detailVc.auditionType = AuditionType.Personalised
        }
        self.navigationController?.pushViewController(detailVc, animated: true)
    }
    
    
}
