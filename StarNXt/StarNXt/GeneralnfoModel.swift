//
//  GeneralnfoModel.swift
//  StarNXt
//
//  Created by Mac on 9/21/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class GeneralnfoModel: NSObject, NSCoding {

    static var sharedGeneralInfo = GeneralnfoModel()

    
    var userRole : String = ""
    var userNumber : String = ""
    var userActiveStatus : Bool = false
    var userSubscriptionPlanIsActiveStatus : Bool = false
    var userCurrentSubscriptionPlan : SubscriptionPlan = .Month
    var userSubscriptionPlanStartDate : Date?
    var userSubscriptionExpiry : Bool = false
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.userRole, forKey: "userRole")
        aCoder.encode(self.userNumber, forKey: "userNumber")
        aCoder.encode(self.userActiveStatus, forKey: "userActiveStatus")
        aCoder.encode(self.userSubscriptionPlanIsActiveStatus, forKey: "userSubscriptionPlanIsActiveStatus")
        aCoder.encode(self.userCurrentSubscriptionPlan, forKey: "userCurrentSubscriptionPlan")
        aCoder.encode(self.userSubscriptionPlanStartDate, forKey: "userSubscriptionPlanStartDate")
        aCoder.encode(self.userSubscriptionExpiry, forKey: "userSubscriptionExpiry")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.userRole =  aDecoder.decodeObject(forKey:  "userRole") as? String ?? ""
        self.userNumber =  aDecoder.decodeObject(forKey:  "userNumber") as? String ?? ""
        self.userActiveStatus = aDecoder.decodeBool(forKey: "userActiveStatus")
        self.userSubscriptionPlanIsActiveStatus = aDecoder.decodeBool(forKey: "userSubscriptionPlanIsActiveStatus")
        self.userSubscriptionExpiry = aDecoder.decodeBool(forKey: "userSubscriptionExpiry")
        self.userSubscriptionPlanStartDate = aDecoder.decodeObject(forKey: "userSubscriptionPlanStartDate") as? Date ?? Date()
        self.userCurrentSubscriptionPlan = aDecoder.decodeObject(forKey: "userCurrentSubscriptionPlan") as? SubscriptionPlan ?? .Day
        
    }
    
    override init() {
        
    }
    
    
    func clearData() {
       
    }
    
    
}
