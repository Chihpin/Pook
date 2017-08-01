//
//  Pook.swift
//  Pook
//
//  Created by Chihpin on 2017/7/10.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit

class Book: Model, FromApiJson {
    /*
    {
        "size" : 615835,
        "keywords" : "",
        "weekvote" : 0,
        "category" : 10,
        "postdate" : "Jul 20, 2017 1:09:58 AM",
        "weekvisit" : 0,
        "firstflag" : false,
        "author" : "纳兰康成",
        "lastupdate" : "Jul 20, 2017 1:19:09 AM",
        "articlename" : "软饭天王",
        "authorflag" : false,
        "subcategory" : 10,
        "hashCode" : -2147483648,
        "lastchapter" : "第二百三十四章——最爱做的事儿",
        "usecustomizeinfotitle" : false,
        "lastchapterno" : 47495,
        "initial" : "r",
        "monthvisit" : 254,
        "imgflag" : 1,
        "dayvote" : 0,
        "authorid" : 0,
        "allvisit" : 254,
        "monthvote" : 0,
        "articleno" : 123,
        "usecustomizelisttitle" : false,
        "fullflag" : false,
        "allvote" : 0,
        "deleteflag" : false,
        "chapters" : 235,
        "dayvisit" : 0,
        "intro" : "一次意外，翟南来到了一个文娱产业匮乏的平行世界。\n    只不过在这个世界里，翟南却换了一个身份，成为了超一线女星的隐婚丈夫，娱乐圈头号软饭王。\n    “翟南先生，请问你除了吃软饭，还会什么？”\n    “也就是写写小说，唱唱歌，拍个电影，电视剧什么的。没事儿领点国际大奖，偶尔客串几次评委而已。”\n",
        "pinyin" : "ruanfantianwang"
    }
    */
    
    
    var id: Int = 0
    
    var name: String = ""
    
    var author: String = ""
    
    var chapters = [Chapter]()
    
    var size: Int = 0
    
    var category: Int = 0
    
    var intro: String = ""
    
    var update: String = ""
    
    var isFull: Bool = false
    
    var chapterCount: Int = 0
    
    var cover: String = ""
    
    
    var lastChapter: Chapter?
    
    
    required init(json: Dictionary<String, Any>) {
        super.init()
        
        id = json["articleno"] as! Int
        name = json["articlename"] as! String
        author = json["author"] as! String
        intro = json["intro"] as! String
        update = json["lastupdate"] as! String
        isFull = json["fullflag"] as! Bool
        chapterCount = json["chapters"] as! Int
        size = json["size"] as! Int
        category = json["subcategory"] as! Int
        
        cover = "\(ApiURL.Host)/books/cover/\(id/1000)/\(id)/\(id)s.jpg"
        
        let last = Chapter()
        last.id = json["lastchapterno"] as! Int
        last.title = json["lastchapter"] as! String
        lastChapter = last
        
    }
}
