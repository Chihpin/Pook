//
//  Chapter.swift
//  Pook
//
//  Created by Chihpin on 2017/7/10.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit

class Chapter: NSObject {
    
    var bookId : NSString!
    
    var title : NSString!
    
    var content : NSString!
    
    var rangeArray:[NSRange] = []
    
    var isLocal : Bool!
    
    var chapters = [Chapter]()
    
    var record : Record?
    
    var marks = [Mark]()
}
