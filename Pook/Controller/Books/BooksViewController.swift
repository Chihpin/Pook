//
//  BooksViewController.swift
//  Pook
//
//  Created by Chihpin on 2017/7/26.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit

class BooksViewController: ViewController, UITableViewDataSource, UITableViewDelegate {
    
    var page  = 1
    var data  = Array<Book>()
    let table = TableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 110
        table.separatorInset = .zero
        table.separatorColor = UIColor(colorLiteralRed: 145, green: 145, blue: 145, alpha: 1);
        table.mj_header = RefreshTop(refreshingBlock: { [weak self] in
            self?.page = 1
            self?._request()
        })
        table.mj_footer = RefreshBottom(refreshingBlock: { [weak self] in
            self?.page += 1
            self?._request()
        })
        self.view.addSubview(table)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        table.frame = self.view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !loaded {
            Hud.show();
            _request()
            loaded = true
        }
    }
    
    func _request() {
        Api.get(url: ApiURL.Book.List.url, params: ["page":page], completion: { [weak self](response, error) in
            Hud.hide()
            var array = Array<Book>()
            if let items = response?["data"] as? Array<JsonMap> {
                array = JsonArrayMaping(jsons: items)
            }
            if self?.page == 1 {
                // 刷新
                self?.data = array
                self?.table.mj_header.endRefreshing()
            } else {
                // 更多
                self?.data += array
                self?.table.mj_footer.endRefreshing()
            }
            self?.table.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UITableViewDataSource, UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "cell"
        var cell = table.dequeueReusableCell(withIdentifier: id) as? BookCell
        if cell == nil {
            cell = BookCell(style: .default, reuseIdentifier: id)
        }
        
        let book = data[indexPath.row]
        cell!.coverView.kf.setImage(with: book.cover, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, url) in
        }
        cell!.nameLabel.text = book.name
        cell!.introLabel.text = book.intro
        cell!.authorLabel.text = book.author
        cell!.categoryLabel.text = book.category.string
        
        let size = book.size
        var text = ""
        if size < 10000 {
            text = "\(size)字"
        } else {
            text = "\(size/10000)万字"
        }
        cell!.sizeLabel.text = text
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        let next = BookInfoViewController()
        next.book = data[indexPath.section]
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
    }
}
