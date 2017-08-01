//
//  Hud.swift
//  Pook
//
//  Created by Chihpin on 2017/8/1.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit


extension UIView {
    
    public func subview<T:UIView>(type: T.Type) -> T? {
        for sub in self.subviews {
            if sub === type {
                return sub as? T
            }
        }
        return nil
    }
}


class Hud {
    private var hud: UIActivityIndicatorView?
    
    func _show() {
        if let win = UIApplication.shared.delegate?.window {
            hud = win!.subview(type: UIActivityIndicatorView.self)
            if hud == nil {
                hud = UIActivityIndicatorView(activityIndicatorStyle: .gray)
                hud!.center = CGPoint(x: win!.bounds.size.width/2, y: win!.bounds.size.height/2)
                win!.addSubview(hud!)
            }
            win!.bringSubview(toFront: hud!)
            hud!.startAnimating()
        }
    }
    
    func _hide() {
        hud?.stopAnimating()
    }
}

extension Hud {
    
    private static let _HUD = Hud()
    
    class func show() {
        _HUD._show()
    }
    
    class func hide() {
        _HUD._hide()
    }
}
