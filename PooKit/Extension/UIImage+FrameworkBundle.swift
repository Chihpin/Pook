//
//  UIImage+FrameworkBundle.swift
//  Pook
//
//  Created by Chihpin on 2017/7/30.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import Foundation

extension UIImage {
    
     // load from framework bundle
    
    convenience init?(fb_named name: String) {
        self.init(named: name, in:Bundle(for: DZMReadViewController.self), compatibleWith:nil)
    }
}
