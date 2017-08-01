//
//  AppTabBarController.swift
//  Pook
//
//  Created by Chihpin on 2017/7/26.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit

class AppTabBarController: UITabBarController {

    let bookcaseController = BookcaseViewController()
    let booksController = BooksViewController()
    let mineController  = MineViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookcaseController.title = "书架";
        booksController.title = "书库";
        mineController.title = "我的";
        
        
        self.viewControllers = [UINavigationController.init(rootViewController: bookcaseController),
                                UINavigationController.init(rootViewController: booksController),
                                UINavigationController.init(rootViewController: mineController)];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
