//
//  ResourceResultViewController.swift
//  StarNXt
//
//  Created by Mac on 9/13/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ResourceResultViewController: BaseViewController {

    @IBOutlet weak var resultTableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.register(UINib.loadNib(nibName: CellIdentifier.resourceTableViewCell), forCellReuseIdentifier: CellIdentifier.resourceTableViewCell)
      
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: " ", style: .plain, target: self, action: nil)
        self.view.backgroundColor = UIColor.init(red: 243.0/255.0, green: 247.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
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

//MARK: - Button Actions
extension ResourceResultViewController {
    
    @objc func onBrowseAction(sender : UIButton) -> Void{
        if let url = URL(string: "https://www.hackingwithswift.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @objc func onPhoneAction(sender : UIButton) -> Void{
        if let url = URL(string: "tel://\(9597707175)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @objc func onLocationAction(sender : UIButton) -> Void{
        
    }
}

extension ResourceResultViewController : UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.resourceTableViewCell, for: indexPath) as! ResourceResultTableViewCell
        cell.browseBtn.tag = indexPath.row
        cell.browseBtn.addTarget(self, action: #selector(onBrowseAction(sender:)), for: .touchUpInside)
        
        cell.locationBtn.tag = indexPath.row
        cell.locationBtn.addTarget(self, action: #selector(onLocationAction(sender:)), for: .touchUpInside)
        
        cell.phoneBtn.tag = indexPath.row
        cell.phoneBtn.addTarget(self, action: #selector(onPhoneAction(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
