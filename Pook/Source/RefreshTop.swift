//
//  RefreshTop.swift
//  Pook
//
//  Created by Chihpin on 2017/8/1.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit
import PullToRefresh

class RefreshTop: PullToRefresh {
    
    convenience init() {
        self.init(height: 80, position: .top)
    }
}
