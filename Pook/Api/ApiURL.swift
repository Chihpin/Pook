
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
    
    static let Host = "http://book.chihpin.com"
    static let Base = "http://book.chihpin.com/api"
    
//    static let Host = "http://172.16.1.23:8080"
//    static let Base = "http://172.16.1.23:8080/api"
    
    
    // MARK: -
    
    enum User {
        case Reg
        case Login
        case Info
        case Edit
        
        var url : String {
            switch self {
            case .Reg:
                return "\(ApiURL.Base)/user/reg"
            case .Login:
                return "\(ApiURL.Base)/user/login"
            case .Info:
                return "\(ApiURL.Base)/user/info"
            case .Edit:
                return "\(ApiURL.Base)/user/edit"
            }
        }
    }
    
    enum Category {
        case List
        
        var url : String {
            switch self {
            case .List:
                return "\(ApiURL.Base)/category/list"
            }
        }
    }
    
    enum Book {
        case List
        case Info
        case Top
        case Search
        case Download
        
        var url : String {
            switch self {
            case .List:
                return "\(ApiURL.Base)/book/list"
            case .Info:
                return "\(ApiURL.Base)/book/info"
            case .Top:
                return "\(ApiURL.Base)/book/top"
            case .Search:
                return "\(ApiURL.Base)/book/search"
            case .Download:
                return "\(ApiURL.Base)/book/download"
            }
        }
    }
    
    enum Chapter {
        case List
        
        var url : String {
            switch self {
            case .List:
                return "\(ApiURL.Base)/chapter/list"
            }
        }
    }
    
    
    enum Sub {
        case Add
        case Del
        case List
        
        var url : String {
            switch self {
            case .Add:
                return "\(ApiURL.Base)/sub/add"
            case .Del:
                return "\(ApiURL.Base)/sub/del"
            case .List:
                return "\(ApiURL.Base)/sub/list"
            }
        }
    }
    
    
    enum Bookcase {
        case List
        
        var url : String {
            switch self {
            case .List:
                return "\(ApiURL.Base)/bookcase/list"
            }
        }
    }
}
