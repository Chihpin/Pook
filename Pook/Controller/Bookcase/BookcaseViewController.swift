//
//  ShelfViewController.swift
//  Pook
//
//  Created by Chihpin on 2017/7/26.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit
import PooKit
import Kingfisher

class BookcaseViewController: ViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

//    let button = UIButton();
    var data = Array<Book>();
    var bookcase: UICollectionView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        button.frame = CGRect(x: 100, y: 100, width: 100, height: 40);
//        button.setTitle("看书", for: .normal)
//        button.backgroundColor = UIColor.blue;
//        button.addTarget(self, action:#selector(openBook), for: .touchUpInside)
//        self.view.addSubview(button);
        
        let lay = UICollectionViewFlowLayout()
        lay.itemSize = CGSize(width: 80, height: 120)
        
        bookcase = UICollectionView(frame: .zero, collectionViewLayout: lay);
        bookcase!.register(BookcaseCell.self, forCellWithReuseIdentifier: "c")
        self.view.addSubview(bookcase!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func openBook() -> Void {
        let url = Bundle.main.url(forResource: "求魔", withExtension: "txt")
    
        DZMReadParser.ParserLocalURL(url: url!) {[weak self] (readModel) in
            
            let readController = DZMReadController()
            
            readController.readModel = readModel
            readController.hidesBottomBarWhenPushed = true;
            self?.navigationController?.pushViewController(readController, animated: true)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let id = "c"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! BookcaseCell
        
        let book = data[indexPath.row]
        cell.imageView.kf.setImage(with: book.cover, placeholder: nil, options: nil, progressBlock: nil) { [weak cell] (image, error, cacheType, url) in
            cell?.nameLabel.isHidden = error == nil
        }
        return cell
    }

}
