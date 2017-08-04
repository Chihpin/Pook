//
//  Chapter.swift
//  Pook
//
//  Created by Chihpin on 2017/7/10.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit

class Chapter: Model, Mappable {
    /*
    {
        "nextChapterno": 0,
        "preChapterno": 0,
        "pinyin": "gangyu1975",
        "hashCode": -2147483648,
        "chapterno": 11,
        "articleno": 2,
        "articlename": "港娱1975",
        "chaptertype": 0,
        "chaptername": "第1章 初遇女神",
        "size": 4222,
        "isvip": false,
        "postdate": "Jul 17, 2017 3:38:37 PM",
        "deleteflag": false
    }
    */
    
    var id : Int = 0
    
    var title : String = ""
    
    var size : Int = 0
    
    var date : String = ""
    
    
    required convenience init?(json: JsonMap) {
        self.init()
        id      = json.intValue(key: "chapterno")
        title   = json.stringValue(key: "chaptername")
        size    = json.intValue(key: "size")
        date    = json.stringValue(key: "postdate")
    }
}
