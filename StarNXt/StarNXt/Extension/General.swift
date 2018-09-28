//
//  General.swift
//  Sconce
//
//  Created by Pandiyaraj on 30/05/18.
//  Copyright © 2017 Pandiyaraj. All rights reserved.
//

import UIKit
import QuartzCore
//import PKHUD

extension Data {
    /// Returns a hex string from the given data
    ///
    /// - Returns: String
    func hexString() -> String {
        return self.reduce("") { string, byte in
            string + String(format: "%02X", byte)
        }
    }
}


extension Optional {
    
    /// Attempts to unwrap the optional, and executes the closure if a value exists
    ///
    /// - Parameter block: The closure to execute if a value is found
    /// - Throws: throws (Apply catch)
    public func unwrap( block: (Wrapped) throws -> ()) rethrows {
        if let value = self {
            try block(value)
        }
    }
}

/*private var networkActivityCount = 0
extension UIApplication {
    
    func startNetworkActivity(info: String?) {
        networkActivityCount += 1
        isNetworkActivityIndicatorVisible = true
        if info != nil {
            let contentType = HUDContentType.labeledProgress(title: "Just a moment..", subtitle: info)
            HUD.show(contentType)
        }
        else {
            HUD.show(.progress)
        }
    }
    
    func stopNetworkActivity() {
        
        if networkActivityCount < 1 {
            return;
        }
        
        networkActivityCount -= 1
        if networkActivityCount == 0 {
            isNetworkActivityIndicatorVisible = false
            DispatchQueue.main.async(execute: {
                HUD.hide(animated: true)
            })
        }
    }
}
*/
extension Float {
    func roundTo(places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}


extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func rupeesFormatt() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}

extension Int {
    func rupeesFormatt() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
extension UINib{
    static func loadNib(nibName : String) -> UINib? {
        return UINib(nibName: nibName, bundle: nil)
    }
}

//: Decodable Extension

extension Decodable {
    static func decode(data: Data) throws -> Self {
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}

//: Encodable Extension

extension Encodable {
    func encode() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return try encoder.encode(self)
    }
}

extension UINavigationBar {
    
   static func setGradientColor(color1:  UIColor , color2 : UIColor) -> Void {
        let gradient = CAGradientLayer()
        let sizeLength = UIScreen.main.bounds.size.height * 2
        let defaultNavigationBarFrame = CGRect(x: 0, y: 0, width: sizeLength, height: 64)
        gradient.frame = defaultNavigationBarFrame
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        UINavigationBar.appearance().setBackgroundImage(self.image(fromLayer: gradient), for: .default)
    }
    
   static func image(fromLayer layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }
}
