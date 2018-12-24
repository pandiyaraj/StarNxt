//
//  SharedMethods.swift
//  StarNXt
//
//  Created by Mac on 12/23/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class SharedMethods: NSObject {

    static let sharedInstance = SharedMethods()
    
    var stateTotalList:Array<Any> = []
    var stateList = [String]()
    
    func loadStateList()  {
        if let path = Bundle.main.path(forResource: "state_city", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let states = jsonResult["states"] as? [Any] {
                    // do stuff
                    stateTotalList = states
                    if let stateListArray = stateTotalList as? NSArray{
                        var stateArrayList = [String]()
                        for stateInfo in stateListArray{
                            if let stateInfo = stateInfo as? NSDictionary
                            {
                                stateArrayList.append(stateInfo["state"] as! String)
                            }
                        }
                        stateList = stateArrayList
                    }
                    
                    print("stateList - \(stateList.count)")
                }
            } catch {
                // handle error
            }
        }
    }
    
    
    func fetchDistrictList(stateName : String) -> [String]{
        
        let filteredDistrict = stateTotalList.filter { (object) -> Bool in
            if let object = object as? NSDictionary{
                let stateNameStr = object.value(forKey: "state") as? String ?? ""
                return stateName.isEqualToString(findString: stateNameStr)
            }else{
                return false
            }
        }
        
        if filteredDistrict.count > 0 {
            if let filteredDistrictObj = filteredDistrict[0] as? NSDictionary{
                return filteredDistrictObj["districts"] as! [String]
            }
        }
        
        return []

    }
}
