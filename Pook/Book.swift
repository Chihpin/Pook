//
//  Pook.swift
//  Pook
//
//  Created by Chihpin on 2017/7/10.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit

class Book: Model, FromJson {
    
    var bookId : NSString!
    
    var isLocal : Bool!
    
    var chapters = [Chapter]()
    
    var record : Record?
    
    var marks = [Mark]()
    
    required init?(Json json: Dictionary<String, Any>) {
        
    }
    
}
