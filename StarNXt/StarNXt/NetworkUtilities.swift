//
//  NetworkUtilities.swift
//  Sconce
//
//  Created by Pandiyaraj on 01/01/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//
//
//  Have to implement Reachability
//
//
import UIKit
extension URLSession
{
    /// Return data from synchronous URL request
    public func requestSynchronousData(request: URLRequest) -> (NSData?, URLResponse?) {
        var data: NSData?, response: URLResponse?
        
        let semaphore = DispatchSemaphore(value: 0)
        
        
        let task = self.dataTask(with: request as URLRequest) { (taskData, taskResponse, taskError) in
            data = taskData as NSData?
            response = taskResponse
            if data == nil, let taskError = taskError {print(taskError)}
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        
        return (data, response)
    }
}

public class NetworkUtilities {
    
    /**
     create session
     
     - parameter contentType: either JSON OR URLENCODED
     
     - returns: URLSession
     */
    static func getSessionWithContentType(contentType : String) -> URLSession {
        let sessoinConfiguration = URLSessionConfiguration.default
        sessoinConfiguration.httpAdditionalHeaders = ["Content-Type":contentType]
        let session : URLSession  = URLSession.shared
        return session
    }
    
    
    
    /**
     Create mutable url request to send the server
     
     - parameter actionName:  which action to be performed login
     - parameter httpMethod:  either POST OR GET OR PUT OR DELETE
     - parameter requestBody: parameters
     - parameter contentType: either JSON OR URLENCODED
     
     - returns: URLRequest
     */
    static func getUrlRequest(actionName:String , httpMethod : String, requestBody: AnyObject?,contentType : String) -> URLRequest {
        
        var  urlString : String
        
        urlString = "\(actionName)"
        
        print("*******\(urlString) *****")
        
        
        
        
        let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let requestUrl = NSURL.init(string: url!)
        
        var request  = URLRequest(url: requestUrl! as URL)
        request.httpMethod = httpMethod
        request.timeoutInterval = 60
        
        var jsonData = Data()
        if contentType == CommonValues.jsonApplication {
            if requestBody != nil{
                do {
                    jsonData = try JSONSerialization.data(withJSONObject: requestBody!, options: .prettyPrinted)
                    // here "jsonData" is the dictionary encoded in JSON data
                    
                    //#-- For checking given format is json or not
                    //  let jsonString = NSString.init(data: jsonData, encoding: String.Encoding.utf8.rawValue)
                    //print(jsonString as Any);
                    
                    request.httpBody =  jsonData
                    let postLength = String(jsonData.count)
                    request.setValue(contentType, forHTTPHeaderField: "Content-type")
                    request.setValue(postLength, forHTTPHeaderField: "Content-Length")
                } catch let error as NSError {
                    //print(error)
                }
            }
        }
        
        if contentType == CommonValues.urlencoded {
            if requestBody != nil {
                if requestBody as? String != nil{
                    jsonData = "xmldata=\(requestBody as! String)".data(using: .utf8)!
                }
                
                request.httpBody = jsonData
            }
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.setValue("application/xml", forHTTPHeaderField: "Accept")
            
            //            request.setValue("application/json", forHTTPHeaderField: "Accept")
        }
        else{
            
        }
        
        return request
        
    }
    
    /**
     Synchronous request
     
     - parameter actionName:  action Name like Login
     - parameter httpMethod:  http methid like Get or Post
     - parameter requestBody: parameters with json format
     - parameter contentType: content type - json or urlencoded
     
     - returns: Object if success or error
     */
    static public func sendSynchronousRequestToServer(actionName : String,httpMethod : String, requestBody :AnyObject?, contentType : String ) -> AnyObject?{
        let request = self.getUrlRequest(actionName: actionName, httpMethod: httpMethod, requestBody: requestBody, contentType: contentType)
        let responseObject = self.getSessionWithContentType(contentType: contentType).requestSynchronousData(request: request)
        return self.getResponseData(responseData: responseObject.0, response: responseObject.1)
    }
    
    /**
     Asynchronous request
     
     - parameter actionName:        action Name like Login
     - parameter httpMethod:        http methid like Get or Post
     - parameter requestBody:       parameters with json format
     - parameter contentType:       ontent type - json or urlencoded
     - parameter completionHandler: completiontype Called after request was finished or failed
     */
    static public func sendAsynchronousRequestToServer(actionName:String, httpMethod:String, requestBody:AnyObject?, contentType:String, completionHandler: @escaping ((_ obj: AnyObject)->())){
        let request = self.getUrlRequest(actionName: actionName, httpMethod: httpMethod, requestBody: requestBody, contentType: contentType)
        let  postDataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            completionHandler(self.getResponseData(responseData: data as NSData?, response: response)!)
        };
        postDataTask.resume()
    }
    
    
    
    static func getResponseData(responseData : NSData? , response: URLResponse?) -> AnyObject? {
        guard response != nil else{
            return "Your device is having poor or no connection to connect the server. Please check or reset your connection." as AnyObject?;
        }
        let httpResponse = response as? HTTPURLResponse
        let statusCode = httpResponse?.statusCode
        let allHeaderFields : NSDictionary = (httpResponse?.allHeaderFields)! as NSDictionary
        let contentType = allHeaderFields.value(forKey: "Content-Type") as? String
        
        //#-- Response is success
        if statusCode == 200 {
            //#-- Check respose is either JSON or XML or TEXT
            
            if (httpResponse?.url?.relativePath.contains("subscription"))!{
                let responseStr  = NSString.init(data:responseData! as Data, encoding: String.Encoding.utf8.rawValue)
                return responseStr as! AnyObject
                
            }
            
            if httpResponse?.url?.absoluteString == URLConstants.BASEURL {
//                return ErrorMessage.serverReachableMessage as! AnyObject
            }
            
            if (contentType!.range(of:"application/json") != nil ) {
                //#--  JSON
                var jsonResponse: AnyObject?
                do {
                    jsonResponse = try JSONSerialization.jsonObject(with: responseData! as Data, options: JSONSerialization.ReadingOptions()) as AnyObject
                } catch let jsonError {
                    print(jsonError)
                }
                return jsonResponse
            }
            else if (contentType!.range(of:"text/json") != nil) || (contentType!.range(of:"text/html") != nil){
                let responseStr  = NSString.init(data:responseData! as Data, encoding: String.Encoding.utf8.rawValue)
                
                if let responseData1 = responseStr?.data(using: String.Encoding.utf8.rawValue) {
                    do {
                        let value = try? JSONSerialization.jsonObject(with: responseData1, options: [])
                        if value == nil {
                            return "System error" as AnyObject
                        }
                        return value as AnyObject?
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
                
            else {
                //#-- Do part other values
                
                let responseStr  = NSString.init(data:responseData! as Data, encoding: String.Encoding.utf8.rawValue)
                if (responseStr != nil)  {
                    return responseStr
                }
                
            }
            
        }  else if statusCode == 204 {
            return "success" as AnyObject?
        } else {
            //#-- Response is failure case
            var jsonResponse : AnyObject?
            do {
                jsonResponse = try JSONSerialization.jsonObject(with: responseData! as Data, options: JSONSerialization.ReadingOptions()) as AnyObject
            } catch let jsonError {
                print(jsonError)
            }
            
            if jsonResponse as? NSDictionary != nil
            {
                let response = jsonResponse as! NSDictionary
                if  response.value(forKey: "error") as? NSDictionary != nil {
                    let errorDict = response.value(forKey: "error") as! NSDictionary
                    return errorDict.value(forKey: "message") as AnyObject
                }else{
                    return response.value(forKey:"message") as AnyObject
                }
            }else{
                return "Error while send request" as AnyObject?
            }
        }
        return "Error while send request" as AnyObject?
    }
    
    static public func hasConnectivity() -> Bool {
        let reachability  = Reachability()!
        do {
            try reachability.startNotifier()
        } catch {
            
        }
        return reachability.isReachable
    }
    
    static public func uploadImage(requestUrl: String,requestBody:AnyObject?, image: UIImage, imageName:String, completionHandler: @escaping ((_ obj: AnyObject)->())) {
        if self.hasConnectivity(){
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            //        UIApplication.shared.startNetworkActivity(info: "Loading...")
            //            let imageData = UIImagePNGRepresentation(image)
            let imageData = UIImageJPEGRepresentation(image, 0.5)
            var request = URLRequest(url: URL(string: requestUrl)!)
            request.httpMethod = HttpMethod.POST
            let boundary = "----WebKitFormBoundary7MA4YWxkTrZu0gW"
            
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            request.setValue("Sconce", forHTTPHeaderField: "tenant")
            let body = NSMutableData();
          
            let mimetype = "image/png"
            let filePathKey = "upload"
            
            body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            body.append("Content-Disposition: form-data; name=\"\(filePathKey)\"; filename=\"\(imageName)\"\r\n".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            body.append(imageData!)
            body.append("\r\n".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            
            body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            request.httpBody = body as Data
            
            let task = URLSession.shared.dataTask(with: request) {
                data, response, error in
                
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
                if error != nil {
                    completionHandler(error as AnyObject)
                    return
                }
                // You can print out response object
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? AnyObject
                    completionHandler(json!)
                    
                }catch
                {
                    print(error)
                    completionHandler(error as AnyObject)
                }
            }
            task.resume()
        }
        else{
            completionHandler(ErrorMessage.noInternetMessage as AnyObject)
        }
    }
}



