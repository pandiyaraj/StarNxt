//
//  DetailTableViewController.swift
//  StarNXt
//
//  Created by Mac on 12/22/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit



class DetailTableViewController: UIViewController {

    
    var listArray = [String]()
    var completionHandler: ((_ obj : String)->Void)!
    var selectedText : String = ""
    
    @IBOutlet weak var listTableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

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

//    func searchList(searchText : String) -> Void
//    {
//        displayArray = listArray.contains(where: { (object) -> Bool in
//            return object.c
//        })
//    }
}


extension DetailTableViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.trimmedLength() > 3{
//            
//        }
    }
}

extension DetailTableViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let textstr  = listArray[indexPath.row]
        cell.textLabel?.text = textstr
        if selectedText.isEqualToString(findString: textstr){
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (completionHandler != nil){
            completionHandler(listArray[indexPath.row])
            self.navigationController?.popViewController(animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
