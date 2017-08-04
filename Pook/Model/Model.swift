//
//  Model.swift
//  Pook
//
//  Created by Chihpin on 2017/7/10.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit
import Kingfisher

extension String: Resource {
    /// The key used in cache.
    public var cacheKey: String { get { return self } }
    
    /// The target image URL.
    public var downloadURL: URL { get { return URL(string: self)! } }
}

/// extension Dictionary default value if not found
extension Dictionary where Key : CustomStringConvertible, Value : Any {
    
    func intValue(key: String) -> Int {
        if let value = self[key as! Key] {
            return value as! Int
        }
        return 0
    }
    
    func boolValue(key: String) -> Bool {
        if let value = self[key as! Key] {
            return value as! Bool
        }
        return false
    }
    
    func floatValue(key: String) -> Float {
        if let value = self[key as! Key] {
            return value as! Float
        }
        return 0
    }
    
    func doubleValue(key: String) -> Double {
        if let value = self[key as! Key] {
            return value as! Double
        }
        return 0
    }
    
    func stringValue(key: String) -> String {
        if let value = self[key as! Key] {
            return value as! String
        }
        return ""
    }
    
    func arrayValue(key: String) -> Array<Any> {
        if let value = self[key as! Key] {
            return value as! Array<Any>
        }
        return Array()
    }
}



typealias JsonMap = Dictionary<String, Any>
typealias JsonArray = Array<Any>


protocol Mappable {
    
    init?(json: JsonMap)
}


func JsonArrayMaping<T:Mappable>(jsons: Array<JsonMap>) -> Array<T> {
    var array = Array<T>()
    for item in jsons {
        array.append(T(json: item)!)
    }
    return array
}

class Model: NSObject {
    
}
