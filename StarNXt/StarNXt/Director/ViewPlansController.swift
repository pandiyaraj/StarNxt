//
//  ViewPlansController.swift
//  StarNXt
//
//  Created by Mac on 12/18/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ViewPlansController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.createGradientLayer()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBackAction() -> Void{
        self.navigationController?.popViewController(animated: true)
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
