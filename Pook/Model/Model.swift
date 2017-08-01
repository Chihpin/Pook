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


protocol FromApiJson {
    init(json:Dictionary<String, Any>)
}

class Model: NSObject {
    
}
