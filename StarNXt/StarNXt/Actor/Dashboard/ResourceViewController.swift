//
//  ResourceViewController.swift
//  StarNXt
//
//  Created by Mac on 9/13/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class ResourceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Resources"
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: " ", style: .plain, target: self, action: nil)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : AppFont.getMedium(size: 20)]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchBtnAction() -> Void{
        let resourceResultvc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.resourceresultvc) as! ResourceResultViewController
        self.navigationController?.pushViewController(resourceResultvc, animated: true)
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
