//
//  SearchViewController.swift
//  YShopping_Swift
//
//  Created by kyohei on 2015/06/27.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class SearchViewController: UITableViewController {
    // AppDelegateのインスタンス変数
    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // テーブル行数（検索条件数）
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セル取得
        var cell = tableView.dequeueReusableCellWithIdentifier("search") as? UITableViewCell
        
        // ラベルを取得し、条件をセット
        var textLabel = cell?.viewWithTag(1) as? UILabel
        var selectLabel = cell?.viewWithTag(2) as? UILabel
        switch (indexPath.row) {
            case 0:
                textLabel?.text = "カテゴリ"
                selectLabel?.text = appDelegate.strCategoryName
                break
            case 1:
                textLabel?.text = "フリーワード"
                selectLabel?.text = appDelegate.strFreeword
                break
            case 2:
                textLabel?.text = "表示順序"
                selectLabel?.text = appDelegate.strSortTagName
                break
            default:
                break
        }
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // セグエ実行
        switch (indexPath.row) {
            case 0:
                performSegueWithIdentifier("searchcategorylist", sender: nil)
                break
            case 1:
                performSegueWithIdentifier("searchfreeword", sender: nil)
                break
            case 2:
                performSegueWithIdentifier("searchsortlist", sender: nil)
                break
            default:
                break
            
        }
    }
    
    @IBAction func searchBtn(sender: AnyObject) {
        // 検索結果画面に移動
        self.navigationController?.popViewControllerAnimated(true)
    }
}