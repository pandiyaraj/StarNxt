//
//  ResourceResultListViewController.swift
//  StarNXt
//
//  Created by Mac on 12/20/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ResourceResultListViewController: BaseViewController {

    @IBOutlet weak var listTableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        listTableView.register(UINib.loadNib(nibName: CellIdentifier.resourceListCell), forCellReuseIdentifier: CellIdentifier.resourceListCell)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: " ", style: .plain, target: self, action: nil)
        self.view.backgroundColor = UIColor.init(red: 243.0/255.0, green: 247.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
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
extension ResourceResultListViewController : UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.resourceListCell, for: indexPath) as! ResourceListTableViewCell
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 222
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let resourceDetailVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.resourceresultvc) as! ResourceResultViewController
        self.navigationController?.pushViewController(resourceDetailVc, animated: true)
    }
}
