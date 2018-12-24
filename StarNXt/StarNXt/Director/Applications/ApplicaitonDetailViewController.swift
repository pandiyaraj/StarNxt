//
//  ApplicaitonDetailViewController.swift
//  StarNXt
//
//  Created by Mac on 9/25/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ApplicaitonDetailViewController: UIViewController {

    @IBOutlet weak var aboutMeBtn : UIButton!
    @IBOutlet weak var portfolioBtn : UIButton!
    @IBOutlet weak var contactBtn : UIButton!
    
    @IBOutlet weak var portfolioView : UIView!
    @IBOutlet weak var aboutMeView : UIView!
    @IBOutlet weak var contactView : UIView!
    
    @IBOutlet weak var aboutMeTableView : UITableView!
    @IBOutlet weak var portfolioCollectionView : UICollectionView!
    @IBOutlet weak var contactTableView : UITableView!
    
    @IBOutlet weak var tableViewHeightConstraint :  NSLayoutConstraint!
    @IBOutlet weak var viewleadingConstraint : NSLayoutConstraint!
    @IBOutlet weak var lineView : UIView!
    
    @IBOutlet weak var videoLinkBtn : UITextView!
    @IBOutlet weak var videoLinklbl : UILabel!
    
    var isFromShortList : Bool = false
    
    var person = (MobileNumber: "9090909090", email: "pandiyarj@gmail.com")
    var contactArray = ["Mobile Number":"9090909090","email":"pandiyarj@gmail.com"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
        self.deselectAllButtons()
        aboutMeBtn.sendActions(for: .touchUpInside)
        contactTableView.tableFooterView = UIView()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
//        aboutMeBtn.sendAction()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: " ", style: .plain, target: self, action: nil)

        // Do any additional setup after loading the view.
    }
    
    func registerCells() {
        aboutMeTableView.register(UINib.loadNib(nibName: CellIdentifier.directionApplicationDetailTableCell), forCellReuseIdentifier: CellIdentifier.directionApplicationDetailTableCell)
        
        contactTableView.register(UINib.loadNib(nibName: CellIdentifier.directionApplicationDetailTableCell), forCellReuseIdentifier: CellIdentifier.directionApplicationDetailTableCell)
    
        portfolioCollectionView.register(UINib.loadNib(nibName: CellIdentifier.portfolioCell), forCellWithReuseIdentifier: CellIdentifier.portfolioCell)
        
    }
    
    
    
    @IBAction func aboutMeAction(_ sender : UIButton){
        self.deselectAllButtons()
        sender.isSelected = true
        aboutMeView.isHidden = false
        self.tableViewHeightConstraint.constant = 15 * 75
        UIView.animate(withDuration: 1.0) {
            self.viewleadingConstraint.constant = 0
        }
    }
    
    @IBAction func portfolioAction(_ sender : UIButton){
        self.deselectAllButtons()
        sender.isSelected = true
        portfolioView.isHidden = false
        self.videoLinklbl.isHidden = false
        self.videoLinkBtn.isHidden = false
        UIView.animate(withDuration: 1.0) {
            self.viewleadingConstraint.constant =  self.lineView.width * 1
        }
    }
    
    @IBAction func contactAction(_ sender : UIButton){
        self.deselectAllButtons()
        sender.isSelected = true
        contactView.isHidden = false
        UIView.animate(withDuration: 1.0) {
            self.viewleadingConstraint.constant = self.lineView.width * 2
        }

    }
    
    func deselectAllButtons() {
        aboutMeBtn.isSelected = false
        portfolioBtn.isSelected = false
        contactBtn.isSelected = false
        
        aboutMeView.isHidden = true
        portfolioView.isHidden = true
        contactView.isHidden = true
        
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

