//
//  BooksViewController.swift
//  Pook
//
//  Created by Chihpin on 2017/7/26.
//  Copyright © 2017年 chihpin. All rights reserved.
//

import UIKit

class BookInfoViewController: ViewController, UITableViewDataSource, UITableViewDelegate {
    
    var book: Book?
    var data  = Array<Chapter>()
    let table = TableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.mj_header = RefreshTop(refreshingBlock: { [weak self] in
            self?._request()
        })
        self.view.addSubview(table)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !loaded {
            Hud.show()
            _request()
            loaded = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func _request() {
        if let bookid = book?.id {
            Api.get(url: ApiURL.Book.Info.url, params: ["articleno":bookid], completion: { [weak self](response, error) in
                Hud.hide()
                var array = Array<Chapter>()
                if let items = response?["data"] as? Array<Any> {
                    for item in items {
                        array.append(Chapter(json: item as! JsonMap)!)
                    }
                }
                self?.data = array
                self?.table.reloadData()
                self?.table.mj_header.endRefreshing()
            })
        }
    }

    
    // MARK: UITableViewDataSource, UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "cell"
        var cell = table.dequeueReusableCell(withIdentifier: id)
        if cell == nil {
            cell = ChapterCell(style: .default, reuseIdentifier: id)
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        let chapter = data[indexPath.section]
        
    }
}
