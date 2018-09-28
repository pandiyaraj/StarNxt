//
//  DirectorShortListViewController.swift
//  StarNXt
//
//  Created by Mac on 9/23/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class DirectorShortListViewController: UIViewController {

    @IBOutlet weak var noItemView : NoItemView!
    @IBOutlet weak var shortListView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shortListView.register(UINib.loadNib(nibName: CellIdentifier.directorApplicationListcell), forCellReuseIdentifier:    CellIdentifier.directorApplicationListcell)
        
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
