//
//  GeneralInfoServices.swift
//  StarNXt
//
//  Created by Mac on 11/29/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class GeneralInfoServices: NSObject {

    
    /// Send OTP if user not exists in DB
    ///
    /// - Parameters:
    ///   - mobileNumber: user mobile number
    ///   - userRole: user role either Director or Actor
    ///   - completionHandler: success response
    static func getLoginResponse(mobileNumber : String , userRole: String,  completionHandler: @escaping ((_ status: Bool,_ obj: Any)->())){
        if NetworkUtilities.hasConnectivity() {
            let urlString = URLConstants.userExists
            let paramDict = ["phoneNumber": mobileNumber, "userrole": userRole]
            NetworkUtilities.sendAsynchronousRequestToServer(actionName: urlString, httpMethod: HttpMethod.POST, requestBody:  paramDict as AnyObject, contentType: CommonValues.jsonApplication) { (response) in
                DispatchQueue.main.async {
                    if let responseDict = response as? NSDictionary {
                        print("\(responseDict)")
                        completionHandler(true, responseDict)
                    } else {
                        if let errorMsg = response as? String {
                            print("\(errorMsg)")
                        }
                        completionHandler(false, response as AnyObject)
                    }
                }
            }
        }
        else {
            completionHandler(false, ErrorMessage.noInternetMessage)
        }
    }
}
