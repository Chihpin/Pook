//
//  AppTabBarController.swift
//  Pook
//
//  Created by Chihpin on 2017/7/26.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit

class AppTabBarController: UITabBarController {

    let shelfController = ShelfViewController()
    let booksController = BooksViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shelfController.tabBarItem.title = "书架";
        booksController.tabBarItem.title = "发现";
        
        self.viewControllers = [shelfController, booksController];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
