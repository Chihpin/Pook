//
//  BookcaseCell.swift
//  Pook
//
//  Created by Chihpin on 2017/7/31.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit

class BookcaseCell: UICollectionViewCell {
    let imageView = UIImageView()
    let nameLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor 
        imageView.layer.borderWidth = 1
        imageView.layer.shadowColor = UIColor.lightGray.cgColor
        
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        nameLabel.textAlignment = .center
        
        
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(nameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = self.bounds
        let size = nameLabel.sizeThatFits(CGSize(width: self.bounds.size.width, height: 20))
        nameLabel.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        nameLabel.center = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
    }
    
    
}
