//
//  SearchSortViewController.swift
//  YShopping_Swift
//
//  Created by 藤崎 恭平 on 2015/07/02.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class SearchSortViewController: UITableViewController {
    // AppDelegateのインスタンス変数
    var appDelegate: AppDelegate!
    // ソート条件一覧
    var Sortitems: RLMResults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // インスタンス取得
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Realmからソート条件取得
        Sortitems = Sort.allObjectsInRealm(appDelegate.Yshoppingrealm)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // ソート順数
        return Int(Sortitems.count)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セル取得
        var cell = tableView.dequeueReusableCellWithIdentifier("sortlist") as? UITableViewCell
        
        var taglabel = cell?.viewWithTag(1) as! UILabel
        taglabel.text = Sortitems[UInt(indexPath.row)].name
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 選択した条件取得
        let item = Sortitems.objectAtIndex(UInt(indexPath.row)) as! Sort
        
        // 値を設定
        appDelegate.strSortTag = item.code
        appDelegate.strSortTagName = item.name
        
        // Viewの移動
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
