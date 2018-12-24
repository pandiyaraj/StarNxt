//
//  CreateDirectorProfileViewController.swift
//  StarNXt
//
//  Created by Mac on 9/21/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class CreateDirectorProfileViewController: BaseViewController {

    @IBOutlet weak var directorListCollectionView : UICollectionView!
    @IBOutlet weak var directorListCollectionHeightConstraint : NSLayoutConstraint!
    
    @IBOutlet weak var addPhotoBtn : UIButton!
    @IBOutlet weak var editPhotoBtn : UIButton!

    @IBOutlet weak var nameTextField : SNTextField!
    @IBOutlet weak var phonenumberTextField : SNTextField!
    @IBOutlet weak var emailTextField : SNTextField!
   
    @IBOutlet weak var projectsWorkedTextField : SNTextField!
    
    @IBOutlet weak var aboutMeWorkedTextField : SNTextField!

    
    @IBOutlet weak var stateTextField : SNTextField!
    @IBOutlet weak var cityTextField : SNTextField!
    
    
    var listArray = ["Director", "Co Director","Manager", "Associate Director", "Assistant Director", "Casting Director", "Serial Director","Short Film Director"]
    var isFromSideMenu : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        directorListCollectionView.register(UINib.loadNib(nibName: CellIdentifier.profilecollectioncell), forCellWithReuseIdentifier: CellIdentifier.profilecollectioncell)
        self.updateUI()
        self.title = "Create Profile"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: " ", style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        self.navigationController?.navigationBar.setGradientColor(color1: UIColor(red: 1.00, green: 0.07, blue: 0.40, alpha: 1), color2: UIColor(red: 1.00, green: 0.36, blue: 0.22, alpha: 1))
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        if isFromSideMenu == true{
            let hamburgerBtn = UIBarButtonItem.init(image: UIImage.init(named: "hamburger_menu"), style: .done, target: self, action:#selector(hamburgerMenuAction(_:)))
            self.navigationItem.leftBarButtonItem = hamburgerBtn
        }
    }
    
    @objc func hamburgerMenuAction(_ sender: Any) {
        self.slideMenuController()?.openLeft()
    }
    
    func updateUI() -> Void {
        directorListCollectionHeightConstraint.constant = CGFloat(((listArray.count / 2 ) + 2 ) * 32) - 30
    }
    
    
    @IBAction func getStartedAction() -> Void{
        let getstartedVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.getstartedvc) as!  GetStartedViewController
        self.navigationController?.pushViewController(getstartedVc, animated: true)

    }
    
    @IBAction func onAddPhotoAction() -> Void{
        
    }
    
    @IBAction func onEditPhotoAction() -> Void{
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func pushDetailVc(tag : Int) -> Void{
        
        var tableListArray = [String]()
        switch tag {
        case 6:
            tableListArray = SharedMethods.sharedInstance.stateList
            break;
        case 7:
            if (stateTextField.text?.count)! > 0{
                tableListArray = SharedMethods.sharedInstance.fetchDistrictList(stateName: stateTextField.text!)
            }
            break;
        default:
            listArray = []
        }
        
        let detailVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.detailVc) as! DetailTableViewController
        detailVc.listArray = tableListArray
        self.navigationController?.pushViewController(detailVc, animated: true)
        detailVc.completionHandler = {(selectedStr : String) -> Void in
            DispatchQueue.main.async {
                switch tag{
                case 6:
                    self.stateTextField.text = selectedStr
                    break;
                case 7:
                    self.cityTextField.text = selectedStr
                    break;
                default:
                    tableListArray = []
                }
            }
        }
    }

}

extension CreateDirectorProfileViewController{
    override func textFieldDidBeginEditing(_ textField: UITextField) {
        if let tf = textField as? SNTextField{
            tf.setBorderColor(selected: true)
        }
        
        if textField == stateTextField || textField == cityTextField{
            self.view.endEditing(true)
            self.pushDetailVc(tag: textField.tag)
        }else {
            
        }
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        if let tf = textField as? SNTextField{
            tf.setBorderColor(selected: false)
        }
    }
}
