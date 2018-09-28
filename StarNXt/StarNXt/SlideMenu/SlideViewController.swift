//
//  SlideViewController.swift
//  FirstcarHost
//
//  Created by Ideas2IT-GaneshM on 10/10/17.
//  Copyright © 2017 Pandiyaraj. All rights reserved.
//

import UIKit
//import SDWebImage

class SlideViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    //MARK:-  IBOUTLETS
    
    // -------------UILABELS-------------------
    
    // -- Profile View
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var appVersionLbl: UILabel!
    @IBOutlet weak var viewAccountBtn: UIButton!
    
    var editProfileVc: UIViewController!
    var planHistoryVc: UIViewController!
    var accountVc: UIViewController!
    var notificationsVc: UIViewController!
    var helpVc : UIViewController!
    
    var SelectedGeneralMenuIndex: IndexPath?

 
    var generalMenu = ["Edit Profile","Plan History","Account","Notifications","Help"]
    var menuIcons = ["editprofile","planhistory","account","notifications","help"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileRoleLabl : UILabel!
    @IBOutlet weak var titleHeaderview : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib.loadNib(nibName: "SideMenuTableViewCell"), forCellReuseIdentifier: "generalCell")
        
        self.titleHeaderview.createGradientLayerColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let createProfileVc = self.storyboard?.instantiateViewController(withIdentifier:StoryboardIdentifier.createprofilevc) as!
        CreateProfileViewController
        self.editProfileVc = UINavigationController(rootViewController: createProfileVc)
        
        let historyvc = storyboard.instantiateViewController(withIdentifier:StoryboardIdentifier.planhistoryvc) as!
        PlanHistoryViewController
        self.planHistoryVc = UINavigationController(rootViewController: historyvc)
        
        
        let account = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.accountmenuvc) as! AccountMenuViewController
        self.accountVc = UINavigationController(rootViewController: account)
        
        let helpvc = self.storyboard?.instantiateViewController(withIdentifier:StoryboardIdentifier.helpmenuvc) as!
        HelpViewController
        self.helpVc = UINavigationController(rootViewController: helpvc)

        // Do any additional setup after loading the view.
        self.loadInitialView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            print(version)
            self.appVersionLbl.text = "Version \(version)"
        }
        
        self.profileNameLbl.text = "test"
//        self.profileImageView.sd_setImage(with: URL(string: GeneralInfoModel.SharedGeneralInfo.imageUrl), placeholderImage: UIImage.init(named: "Profile"), options: .highPriority) { (image, error, type, url) in
        
    }
    
    // Mark:- Helper Methods
    func loadInitialView() -> Void{
        
        self.profileNameLbl.text = ""
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
        
        
        
    }
    
    
    // MARK:- Button actions
    
    // View Account button tapped
    
    @IBAction func viewAccountBtnAction(_ sender: Any) {
        //self.slideMenuController()?.closeLeft()
//        DispatchQueue.main.async {
//            self.slideMenuController()?.changeMainViewController(self.myAccountViewController, close: true)
//        }
        
    }
    
    //MARK:- TableView Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generalMenu.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "generalCell", for: indexPath) as! SideMenuTableViewCell
        
        cell.titleLabl.text = "\(generalMenu[indexPath.row])"
        cell.iconImageView.image = UIImage.init(named: "\(menuIcons[indexPath.row])")
        
        cell.titleLabl?.font = AppFont.getRobotoMedium(size: 14)
        cell.titleLabl?.textColor = UIColor.init(hex: 0x404040)
        if SelectedGeneralMenuIndex != nil && self.SelectedGeneralMenuIndex == indexPath{
            cell.textLabel?.font = AppFont.getRobotoMedium(size: 16)
            cell.textLabel?.textColor = UIColor.init(hex: 0xff7142)
            cell.selectionStyle = .none
        }
        return cell
    }
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.SelectedGeneralMenuIndex = indexPath
        self.slideMenuController()?.closeLeft()

        switch indexPath.row {
        case 0:
            DispatchQueue.main.async {
                self.slideMenuController()?.changeMainViewController(self.editProfileVc, close: true)
            }
            break;
        case 1:
            DispatchQueue.main.async {
                self.slideMenuController()?.changeMainViewController(self.planHistoryVc, close: true)
            }
            break;
        case 2:
            DispatchQueue.main.async {
                self.slideMenuController()?.changeMainViewController(self.accountVc, close: true)
            }
            break;
        case 3:
            print("Nothing")
            break;
        case 4:
            DispatchQueue.main.async {
                self.slideMenuController()?.changeMainViewController(self.helpVc, close: true)
            }
           // logout
        default:
            break
        }
    }
    
    func pushVc(controller : UIViewController) -> Void{
        
    }
}
