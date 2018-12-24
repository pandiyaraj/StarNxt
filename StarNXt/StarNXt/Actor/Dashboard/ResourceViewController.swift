//
//  ResourceViewController.swift
//  StarNXt
//
//  Created by Mac on 9/13/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ResourceViewController: UIViewController {

    var resourceArray = ["Acting Institutes","Art Director","Camera & Accessories Rental","Cinematographers","Costume Designer","Choreography","DI Lab","Dolby Atmos","Dubbing Studios","Editor","Lyricsist","Make-up","Music Director","Sound Design","Stills & Photography","Stunt","PRO","VFX & Animation"]
    
    
    @IBOutlet weak var stateTextField : SNTextField!
    @IBOutlet weak var cityTextField : SNTextField!
    @IBOutlet weak var resourceTextField : SNTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Resources"
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: " ", style: .plain, target: self, action: nil)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        
        stateTextField.delegate = self
        cityTextField.delegate = self
        resourceTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchBtnAction() -> Void{
        let resourceResultvc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.resourcelistvc) as! ResourceResultListViewController
        self.navigationController?.pushViewController(resourceResultvc, animated: true)
    }
    
    
    @objc func pushDetailVc(tag : Int) -> Void{
        
        var listArray = [String]()
        switch tag {
        case 0:
            listArray = SharedMethods.sharedInstance.stateList
            break;
        case 1:
            if (stateTextField.text?.count)! > 0{
                listArray = SharedMethods.sharedInstance.fetchDistrictList(stateName: stateTextField.text!)
            }
            break;
        case 2:
            listArray = resourceArray
            break;
        default:
            listArray = []
        }
        
        let detailVc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.detailVc) as! DetailTableViewController
        detailVc.listArray = listArray
        self.navigationController?.pushViewController(detailVc, animated: true)
        detailVc.completionHandler = {(selectedStr : String) -> Void in
            DispatchQueue.main.async {
                switch tag{
                case 0:
                    self.stateTextField.text = selectedStr
                    break;
                case 1:
                    self.cityTextField.text = selectedStr
                    break;
                case 2:
                    self.resourceTextField.text = selectedStr
                    break;
                default:
                    listArray = []
                }
            }
        }
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

extension ResourceViewController : UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let tf = textField as? SNTextField{
//            tf.setBorderColor(alpha: 1.0)
        }
        
        self.pushDetailVc(tag: textField.tag)
        self.view.endEditing(true)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let tf = textField as? SNTextField{
//            tf.setBorderColor(alpha: 0.5)
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
