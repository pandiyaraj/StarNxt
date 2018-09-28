//
//  DirectorApplicationViewController.swift
//  StarNXt
//
//  Created by Mac on 9/23/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class DirectorApplicationViewController: UIViewController {

    @IBOutlet weak var noItemView : NoItemView!
    @IBOutlet weak var applicaitonListView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applicaitonListView.register(UINib.loadNib(nibName: CellIdentifier.directorApplicationListcell), forCellReuseIdentifier:    CellIdentifier.directorApplicationListcell)
        
        noItemView.titleLbl.text = "No applications received yet"

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
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


extension DirectorApplicationViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.directorApplicationListcell, for: indexPath) as! ApplicationTableViewCell
        
        cell.moreBtn.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let applicaitonDetailVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.directorApplicationGrooupvc) as! DirectorApplicationGroupController
        self.navigationController?.pushViewController(applicaitonDetailVc, animated: true)
    }
}
