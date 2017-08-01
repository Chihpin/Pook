//
//  RefreshBottom.swift
//  Pook
//
//  Created by Chihpin on 2017/8/1.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit
import PullToRefresh

extension UIScrollView {
    
    func removePullToRefresh(at position: Position) {
        switch position {
        case .top:
            if let top = self.topPullToRefresh {
                self.removePullToRefresh(top)
            }
        case .bottom:
            if let bottom = self.topPullToRefresh {
                self.removePullToRefresh(bottom)
            }
        }
    }
}


class RefreshBottom: PullToRefresh {
    
    convenience init() {
        self.init(height: 60, position: .bottom)
    }
}
