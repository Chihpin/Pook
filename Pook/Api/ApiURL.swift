
//
//  ApiURL.swift
//  Pook
//
//  Created by Chihpin on 2017/7/31.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import Foundation

enum ApiURL {
    
    
    // MARK: Base
//    private static let Base = "http://book.chihpin.com/api"
//    private static let Base = "http://localhost:8080/api"
    
    
    static let Host = "http://book.chihpin.com"
    static let Base = "http://book.chihpin.com/api"
//    static let Host = "http://172.16.1.107:8080"
//    static let Base = "http://172.16.1.107:8080/api"
    
    
    
    // MARK: -
    case BookList
    case ChapterList
    var url : String {
        switch self {
        case .BookList:
            return "\(ApiURL.Base)/book_list"
        case .ChapterList:
            return "\(ApiURL.Base)/chapter_list"
        }
    }
}
