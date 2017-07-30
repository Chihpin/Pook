//
//  ShelfViewController.swift
//  Pook
//
//  Created by Chihpin on 2017/7/26.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit
import PooKit

class ShelfViewController: ViewController {

    let button = UIButton();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 40);
        button.setTitle("看书", for: .normal)
        button.backgroundColor = UIColor.blue;
        button.addTarget(self, action:#selector(openBook), for: .touchUpInside)
        self.view.addSubview(button);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openBook() -> Void {
        let url = Bundle.main.url(forResource: "求魔", withExtension: "txt")
    
        DZMReadParser.ParserLocalURL(url: url!) {[weak self] (readModel) in
            
            let readController = DZMReadController()
            
            readController.readModel = readModel
            
            self?.navigationController?.pushViewController(readController, animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
