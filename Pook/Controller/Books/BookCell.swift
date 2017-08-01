//
//  BookCell.swift
//  Pook
//
//  Created by Chihpin on 2017/7/31.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    let coverView = UIImageView()
    let nameLabel = UILabel()
    let introLabel = UILabel()
    let authorLabel = UILabel()
    let categoryLabel = UILabel()
    let sizeLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        coverView.contentMode = .scaleAspectFill
        coverView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        coverView.layer.borderWidth = 0.5
        
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        nameLabel.textColor = UIColor.black
        
        introLabel.font = UIFont.boldSystemFont(ofSize: 12)
        introLabel.textColor = UIColor.gray
        introLabel.numberOfLines = 0
        introLabel.lineBreakMode = .byTruncatingTail
        
        authorLabel.font = UIFont.boldSystemFont(ofSize: 10)
        authorLabel.textColor = UIColor.gray
        authorLabel.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        authorLabel.layer.borderWidth = 0.5
        authorLabel.layer.cornerRadius = 2
        authorLabel.layer.masksToBounds = true
        authorLabel.textAlignment = .center
        
        categoryLabel.font = UIFont.boldSystemFont(ofSize: 10)
        categoryLabel.textColor = UIColor.gray
        categoryLabel.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        categoryLabel.layer.borderWidth = 0.5
        categoryLabel.layer.cornerRadius = 2
        categoryLabel.layer.masksToBounds = true
        categoryLabel.textAlignment = .center
        
        sizeLabel.font = UIFont.boldSystemFont(ofSize: 10)
        sizeLabel.textColor = UIColor.gray
        sizeLabel.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        sizeLabel.layer.borderWidth = 0.5
        sizeLabel.layer.cornerRadius = 2
        sizeLabel.layer.masksToBounds = true;
        sizeLabel.textAlignment = .center
        
        self.contentView.addSubview(coverView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(introLabel)
        self.contentView.addSubview(authorLabel)
        self.contentView.addSubview(categoryLabel)
        self.contentView.addSubview(sizeLabel)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        authorLabel.sizeToFit()
        categoryLabel.sizeToFit()
        sizeLabel.sizeToFit()
        
        authorLabel.width += 4;
        categoryLabel.width += 4;
        sizeLabel.width += 4;
        
        authorLabel.height += 4;
        categoryLabel.height += 4;
        sizeLabel.height += 4;
        
        coverView.frame = CGRect(x: 10, y: 10, width: 70, height: self.height-20)
        nameLabel.frame = CGRect(x: 90, y: 10, width: self.bounds.size.width-80-10, height: 18)
        introLabel.frame = CGRect(x: 90, y: 10+18+5, width: self.bounds.size.width-80-10, height: 45)
        
        authorLabel.x = 90
        sizeLabel.rightX = self.bounds.size.width-10
        categoryLabel.rightX = sizeLabel.origin.x-5
        authorLabel.width = min(categoryLabel.origin.x-5-80, authorLabel.width)
        
        sizeLabel.bottomY = coverView.bottomY
        categoryLabel.bottomY = coverView.bottomY
        authorLabel.bottomY = coverView.bottomY
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
