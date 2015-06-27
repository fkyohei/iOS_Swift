//
//  SearchViewController.swift
//  YShopping_Swift
//
//  Created by kyohei on 2015/06/27.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // テーブル行数（検索条件数）
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("search") as? UITableViewCell
        var textLabel = cell?.viewWithTag(1) as? UILabel
        switch (indexPath.row) {
            case 0:
                textLabel?.text = "カテゴリ"
                break
            case 1:
                textLabel?.text = "フリーワード"
                break
            case 2:
                textLabel?.text = "表示順序"
                break
            default:
                textLabel?.text = "カテゴリ"
        }
        
        return cell!
    }
    
}