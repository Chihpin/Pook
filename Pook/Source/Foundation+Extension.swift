
//
//  Foundation+Extension.swift
//  Pook
//
//  Created by Chihpin on 2017/7/31.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import Foundation

/// Convert self to JSON String.
/// - Returns: Returns the JSON as String or empty string if error while parsing.
func JSONStringify(value: AnyObject, prettyPrinted: Bool = true) -> String {
    let options = prettyPrinted ? JSONSerialization.WritingOptions.prettyPrinted : nil
    if JSONSerialization.isValidJSONObject(value) {
        do {
            let data = try JSONSerialization.data(withJSONObject: value, options: options!)
            if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                return string as String
            }
        }  catch {
            return ""
        }
    }
    return ""
}

public extension Collection {
    
    func jsonPrint() {
        print(JSONStringify(value: self as AnyObject))
    }
}
