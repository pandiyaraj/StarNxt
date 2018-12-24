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
    
    var editDirectorProfileVc: UIViewController!
    var editProfileVc: UIViewController!
    var planHistoryVc: UIViewController!
    var accountVc: UIViewController!
    var notificationsVc: UIViewController!
    var helpVc : UIViewController!
    
    var actorDashboardVc : UIViewController!
    var directorDashboardVc : UIViewController!
    
    var SelectedGeneralMenuIndex: IndexPath?

 
    var generalMenu = ["Home","Edit Profile"/*,"Plan History"*/,"Account","Notifications","Help"]
    var menuIcons = ["","menuEdit"/*,"menuPlan"*/,"menuAccount","menuNotifications","menuHelp"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileRoleLabl : UILabel!
    @IBOutlet weak var titleHeaderview : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib.loadNib(nibName: "SideMenuTableViewCell"), forCellReuseIdentifier: "generalCell")
        
        self.titleHeaderview.createGradientLayerColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Actor Dashboard
        let actorDashboard = self.storyboard?.instantiateViewController(withIdentifier:StoryboardIdentifier.actordashboardVc) as!
        ActorDashboardViewController
        let nvcActorDashboard = UINavigationController(rootViewController: actorDashboard)
        nvcActorDashboard.navigationBar.barTintColor = UIColor.white
        nvcActorDashboard.navigationBar.tintColor = UIColor.white
        self.actorDashboardVc = nvcActorDashboard
        
        //Create actor profile
        let createProfileVc = self.storyboard?.instantiateViewController(withIdentifier:StoryboardIdentifier.createprofilevc) as! CreateProfileViewController
        createProfileVc.isFromMenu = true
        let nvcEditProfile = UINavigationController(rootViewController: createProfileVc)
        nvcEditProfile.navigationBar.barTintColor = UIColor.white
        nvcEditProfile.navigationBar.tintColor = UIColor.white
        self.editProfileVc = nvcEditProfile
        
        //Director Dashboard
        let directorDashboard = self.storyboard?.instantiateViewController(withIdentifier:StoryboardIdentifier.directordashboardvc) as!
        DirectorDashboardViewController
        let nvcDirectorDashboardVc = UINavigationController(rootViewController: directorDashboard)
        nvcDirectorDashboardVc.navigationBar.barTintColor = UIColor.white
        nvcDirectorDashboardVc.navigationBar.tintColor = UIColor.white
        self.directorDashboardVc = nvcDirectorDashboardVc
        
        //Director Create Profile
        let createDirectorProfileVc = self.storyboard?.instantiateViewController(withIdentifier:StoryboardIdentifier.createDirectorProfilevc) as!
        CreateDirectorProfileViewController
        createDirectorProfileVc.isFromSideMenu = true
        let nvcDirectorEditProfile = UINavigationController(rootViewController: createDirectorProfileVc)
        nvcDirectorEditProfile.navigationBar.barTintColor = UIColor.white
        nvcDirectorEditProfile.navigationBar.tintColor = UIColor.white
        self.editDirectorProfileVc = nvcDirectorEditProfile
        
        
        //Plan History
        let historyvc = storyboard.instantiateViewController(withIdentifier:StoryboardIdentifier.planhistoryvc) as!
        PlanHistoryViewController
        let nvcPlan = UINavigationController(rootViewController: historyvc)
        nvcPlan.navigationBar.barTintColor = UIColor.white
        nvcPlan.navigationBar.tintColor = UIColor.white
        self.planHistoryVc = nvcPlan
        
        
        //Account
        let account = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.accountmenuvc) as! AccountMenuViewController
        let nvcAccount = UINavigationController(rootViewController: account)
        nvcAccount.navigationBar.barTintColor = UIColor.white
        nvcAccount.navigationBar.tintColor = UIColor.white
        self.accountVc = nvcAccount
        
       
        //HELP
        let helpvc = self.storyboard?.instantiateViewController(withIdentifier:StoryboardIdentifier.helpmenuvc) as!
        HelpViewController
        let nvcHelp = UINavigationController(rootViewController: helpvc)
        nvcHelp.navigationBar.barTintColor = UIColor.white
        nvcHelp.navigationBar.tintColor = UIColor.white
        self.helpVc = nvcHelp

        
        
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
    
    @IBAction func onSwitchAction(sender : UIButton) {
        sender.isSelected = !sender.isSelected
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
        
        if cell.titleLabl.text?.containsIgnoringCase("Notifications") == true{
            cell.notificationSwitch.isHidden = false
            cell.notificationSwitch.addTarget(self, action: #selector(onSwitchAction(sender:)), for: .touchUpInside)
        }else{
            cell.notificationSwitch.isHidden = true

        }
        return cell
    }
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.SelectedGeneralMenuIndex = indexPath
        let selectedRow = self.generalMenu[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! SideMenuTableViewCell
        if selectedRow != "Notifications"{
            self.slideMenuController()?.closeLeft()
        }
        switch selectedRow {
        case "Home":
            if UserDefaults.standard.getUserRole() == Constants.kACTOR{
                DispatchQueue.main.async
                    {self.slideMenuController()?.changeMainViewController(self.actorDashboardVc, close: true)
                }
            }else{
                DispatchQueue.main.async {
                    self.slideMenuController()?.changeMainViewController(self.directorDashboardVc, close: true)
                }
            }
            break;
        case "Edit Profile":
            if UserDefaults.standard.getUserRole() == Constants.kACTOR{
                DispatchQueue.main.async {
                    self.slideMenuController()?.changeMainViewController(self.editProfileVc, close: true)
                }
            }else{
                DispatchQueue.main.async {
                    self.slideMenuController()?.changeMainViewController(self.editDirectorProfileVc, close: true)
                }
            }
            
            break;
        case "Plan History":
            DispatchQueue.main.async {
            self.slideMenuController()?.changeMainViewController(self.planHistoryVc, close: true)
            }
            break;
        case "Account":
            DispatchQueue.main.async {
                self.slideMenuController()?.changeMainViewController(self.accountVc, close: true)
            }
            break;
        case "Notifications":
            print("Nothing")
//            self.onSwitchAction(sender: cell.notificationSwitch)
            break;
        case "Help":
            DispatchQueue.main.async {
                self.slideMenuController()?.changeMainViewController(self.helpVc, close: true)
            }
        default:
            break
        }
    }
    
    func pushVc(controller : UIViewController) -> Void{
        
    }
}
