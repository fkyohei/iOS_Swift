//
//  SearchCategoryViewController.swift
//  YShopping_Swift
//
//  Created by 藤崎 恭平 on 2015/06/29.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class SearchCategoryViewController: UITableViewController {
    // カテゴリ一覧
    var dictCategory = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カテゴリ一覧を設定ファイルから取得
        var filePath = NSBundle.mainBundle().pathForResource("Category.plist", ofType: nil)
        dictCategory = NSDictionary(contentsOfFile: filePath!)!
        println(dictCategory)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // カテゴリ数
        return dictCategory.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セルを取得
        var cell = tableView.dequeueReusableCellWithIdentifier("categorylist") as? UITableViewCell
        
        // ラベルを取得
        var textLabel = cell?.viewWithTag(1) as! UILabel
        textLabel.text = dictCategory[indexPath.row]?.value
//        println(dictCategory[indexPath.row]?.key)
        
        return cell!
    }
}
