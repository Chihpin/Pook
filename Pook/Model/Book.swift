//
//  Pook.swift
//  Pook
//
//  Created by Chihpin on 2017/7/10.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit


class Book: Model, Mappable {
    /*
     1:玄幻魔法\,2:武侠修真\,3:都市言情\,4:历史军事\,5:侦探推理\,6:网游动漫\,7:科幻小说\,8:恐怖灵异\,9:散文诗词\,10:其他
     */
    enum Category: Int {
        case Xuanhuan = 1
        case Wuxia  = 2
        case Dushi  = 3
        case Lish  = 4
        case Zhentan = 5
        case Wangyou = 6
        case Kehuan = 7
        case Kongbu = 8
        case Sanwen = 9
        case Other=10
        
        
        var string : String {
            switch self {
            case .Xuanhuan:
                return "玄幻魔法"
            case .Wuxia:
                return "武侠修真"
            case .Dushi:
                return "都市言情"
            case .Lish:
                return "历史军事"
            case .Zhentan:
                return "侦探推理"
            case .Wangyou:
                return "网游动漫"
            case .Kehuan:
                return "科幻小说"
            case .Kongbu:
                return "恐怖灵异"
            case .Sanwen:
                return "玄幻魔法"
            case .Other:
                return "其他"
            }
        }
    }

    
    
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
    
    var category: Category = .Other
    
    var intro: String = ""
    
    var update: String = ""
    
    var isFull: Bool = false
    
    var chapterCount: Int = 0
    
    var cover: String = ""
    
    var lastChapter: Chapter?
    
    
    required convenience init?(json: JsonMap) {
        self.init()
        
        id      = json.intValue(key: "articleno")
        name    = json.stringValue(key: "articlename")
        author  = json.stringValue(key: "author")
        intro   = json.stringValue(key: "intro")
        update  = json.stringValue(key: "lastupdate")
        isFull  = json.boolValue(key: "fullflag")
        chapterCount = json.intValue(key: "chapters")
        size    = json.intValue(key: "size")
        category = Category(rawValue: json.intValue(key: "subcategory"))!

        cover   = "\(ApiURL.Host)/books/cover/\(id/1000)/\(id)/\(id)s.jpg"

        let last = Chapter()
        last.id     = json.intValue(key: "lastchapterno")
        last.title  = json.stringValue(key: "lastchapter")
        lastChapter = last
    }
}
