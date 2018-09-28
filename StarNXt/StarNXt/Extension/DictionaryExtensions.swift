//
//  DictionaryExtensions.swift
//  Sconce
//
//  Created by Pandiyaraj on 30/05/18.
//  Copyright © 2017 Pandiyaraj. All rights reserved.
//

import Foundation

public extension Dictionary {
	/// Return true if key exists in dictionary.
	func has(key: Key) -> Bool {
		return index(forKey: key) != nil
	}
	
	// Return JSON Data from dictionary.
	public func jsonData(prettify: Bool = false) -> Data? {
		guard JSONSerialization.isValidJSONObject(self) else {
			return nil
		}
		let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
		do {
			let jsonData = try JSONSerialization.data(withJSONObject: self, options: options)
			return jsonData
		} catch {
			return nil
		}
	}
	
	// Return JSON String from dictionary.
	public func jsonString(prettify: Bool = false) -> String? {
		guard JSONSerialization.isValidJSONObject(self) else {
			return nil
		}
		let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
		do {
			let jsonData = try JSONSerialization.data(withJSONObject: self, options: options)
			return String(data: jsonData, encoding: .utf8)
		} catch {
			return nil
		}
	}
}
