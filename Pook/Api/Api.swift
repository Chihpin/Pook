//
//  Api.swift
//  Pook
//
//  Created by Chihpin on 2017/7/30.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import Foundation
import Alamofire

enum ErrorCode: Int {
    case Json = -2
    case Net = -1
    case SUCCESS  = 0
}


class Error {
    var code: Int = ErrorCode.SUCCESS.rawValue
    var message: String? = nil
    
    init(code:Int = 0, message:String? = nil) {
        self.code = code
        self.message = message
    }
}

class Api {
    class func get(url: String,
                   params: [String : Any]? = nil,
                   completion: ((Dictionary<String, Any>?, Error?) -> Swift.Void)? = nil) {
        
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(queue: nil, options: .allowFragments) { (response) in
            
            switch response.result {
            case .success:
                let json = response.result.value as? Dictionary<String, Any>
                let code = json?["status"] as! Int
                
                var rep:[String: Any] = ["code":code]
                do {
                    if let str = json?["dataObj"] as? String,
                        let data = str.data(using: .utf8) {
                        let obj = try JSONSerialization.jsonObject(with: data, options:.mutableContainers)
                        if let dic = obj as? Dictionary<String, Any> {
                            rep["data"] = dic
                        }
                        if let arr = obj as? Array<Any> {
                            rep["data"] = arr
                        }
                    }
                } catch {
                    print("Error deserializing JSON: \(error)")
                    let error = Error(code: ErrorCode.Json.rawValue, message: "Json 解析错误")
                    completion?(rep, error)
                    return
                }
                
                if code == ErrorCode.SUCCESS.rawValue {
                    completion?(rep, nil)
                    return;
                }
                let error = Error(code: code, message: nil)
                completion?(rep, error)
            case .failure(let error):
                completion?(nil, Error(code: ErrorCode.Net.rawValue, message: "请求失败"))
                print(error)
            }
        }
    }
}
