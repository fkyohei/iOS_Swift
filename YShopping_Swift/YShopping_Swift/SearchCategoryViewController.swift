//
//  SearchCategoryViewController.swift
//  YShopping_Swift
//
//  Created by 藤崎 恭平 on 2015/06/29.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class SearchCategoryViewController: UITableViewController {
    // AppDelegateのインスタンス変数
    var appDelegate: AppDelegate!
    // カテゴリ一覧
    var Categoryitems:RLMResults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // インスタンス取得
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Realmからカテゴリ一覧取得
        Categoryitems = CategoryCodeName.allObjectsInRealm(appDelegate.Yshoppingrealm)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // カテゴリ数
        return Int(Categoryitems.count)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セルを取得
        var cell = tableView.dequeueReusableCellWithIdentifier("categorylist") as? UITableViewCell
        
        // ラベルを取得
        var textLabel = cell?.viewWithTag(1) as! UILabel
        textLabel.text = Categoryitems[UInt(indexPath.row)].name
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 選択した条件取得
        let item = Categoryitems.objectAtIndex(UInt(indexPath.row)) as! CategoryCodeName
        // 値を設定
        appDelegate.strCategoryId = item.code
        appDelegate.strCategoryName = item.name
        
        // Viewの移動する
        self.navigationController?.popViewControllerAnimated(true)
    }

}
