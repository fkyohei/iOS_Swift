//
//  SearchSortViewController.swift
//  YShopping_Swift
//
//  Created by 藤崎 恭平 on 2015/07/02.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class SearchSortViewController: UITableViewController {
    // AppDelegateのインスタンス変数
    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    // ソート順コード
    var arySortTag = [
        "-score",   // おすすめ順
        "-sold",    // 売れている順
        "%2Bprice",   // 商品価格が安い順
        "-price",   // 商品価格が高い順
        "-review_count"   // レビュー件数の多い順
    ]
    // ソート順名
    var arySortTagName = [
        "おすすめ順",
        "売れている順",
        "商品価格が安い順",
        "商品価格が高い順",
        "レビュー件数の多い順"
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // ソート順数
        return arySortTag.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セル取得
        var cell = tableView.dequeueReusableCellWithIdentifier("sortlist") as? UITableViewCell
        
        var taglabel = cell?.viewWithTag(1) as! UILabel
        taglabel.text = arySortTagName[indexPath.row]
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 値を設定
        appDelegate.strSortTag = arySortTag[indexPath.row]
        appDelegate.strSortTagName = arySortTagName[indexPath.row]
        
        // Viewの移動
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
