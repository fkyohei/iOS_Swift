//
//  SearchCategoryViewController.swift
//  YShopping_Swift
//
//  Created by 藤崎 恭平 on 2015/06/29.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class SearchCategoryViewController: UITableViewController {
    // カテゴリ名一覧
    var aryCategoryName = [ "すべてのカテゴリから",
                            "ファッション",
                            "食品",
                            "ダイエット、健康",
                            "コスメ、香水",
                            "パソコン、周辺機器",
                            "AV機器、カメラ",
                            "家電",
                            "家具、インテリア",
                            "花、ガーデニング",
                            "キッチン、生活雑貨、日用品",
                            "DIY、工具、文具",
                            "ペット用品、生き物",
                            "楽器、趣味、学習",
                            "ゲーム、おもちゃ",
                            "ベビー、キッズ、マタニティ",
                            "スポーツ",
                            "レジャー、アウトドア",
                            "自転車、車、バイク用品",
                            "CD、音楽ソフト",
                            "DVD、映像ソフト",
                            "本、雑誌、コミック"
    ]
    
    // カテゴリコード一覧
    var aryCategoryCode = [ "1",       //"すべてのカテゴリから"
                            "13457",   //"ファッション"
                            "2498",    //"食品"
                            "2500",    //"ダイエット、健康"
                            "2501",    //"コスメ、香水"
                            "2502",    //"パソコン、周辺機器"
                            "2504",    //"AV機器、カメラ"
                            "2505",    //"家電"
                            "2506",    //"家具、インテリア"
                            "2507",    //"花、ガーデニング"
                            "2508",    //"キッチン、生活雑貨、日用品"
                            "2503",    //"DIY、工具、文具"
                            "2509",    //"ペット用品、生き物"
                            "2510",    //"楽器、趣味、学習"
                            "2511",    //"ゲーム、おもちゃ"
                            "2497",    //"ベビー、キッズ、マタニティ"
                            "2512",    //"スポーツ"
                            "2513",    //"レジャー、アウトドア"
                            "2514",    //"自転車、車、バイク用品"
                            "2516",    //"CD、音楽ソフト"
                            "2517",    //"DVD、映像ソフト"
                            "10002"   //"本、雑誌、コミック"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // カテゴリ数
        return aryCategoryCode.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セルを取得
        var cell = tableView.dequeueReusableCellWithIdentifier("categorylist") as? UITableViewCell
        
        // ラベルを取得
        var textLabel = cell?.viewWithTag(1) as! UILabel
        textLabel.text = aryCategoryName[indexPath.row] as String
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //AppDelegateのインスタンスを取得
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // 値を設定
        appDelegate.strCategoryId = aryCategoryCode[indexPath.row]
        appDelegate.strCategoryName = aryCategoryName[indexPath.row]
        
        // Viewの移動する
        self.navigationController?.popViewControllerAnimated(true)
    }

}
