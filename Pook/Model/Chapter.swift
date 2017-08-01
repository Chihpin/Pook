//
//  Chapter.swift
//  Pook
//
//  Created by Chihpin on 2017/7/10.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit

class Chapter: NSObject, FromApiJson {
    
    var id : Int = 0
    
    var title : String = ""
    
    override init() {
        
    }
    
    required init(json: Dictionary<String, Any>) {
        
    }
}
