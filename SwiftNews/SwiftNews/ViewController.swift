//
//  ViewController.swift
//  SwiftNews
//
//  Created by 藤崎 恭平 on 2015/06/17.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    // ニュースのアドレス
    let newsUrlString = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.itmedia.co.jp/rss/2.0/news_bursts.xml&num=8"
    // エントリーの配列
    var entries = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // テーブルの行数を返す
        return entries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セルを取得する
        var cell = tableView.dequeueReusableCellWithIdentifier("news") as? UITableViewCell
        
        // エントリーを取得する
        var entry = entries[indexPath.row] as! NSDictionary

        // セルにテキストを設定する
        cell?.textLabel!.text = entry["title"] as? String
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // セグエを実行する
        performSegueWithIdentifier("detail", sender: entries[indexPath.row])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // detailセグエの場合
        if segue.identifier == "detail" {
            // DetailControllerを取得する
            var detailContoroller = segue.destinationViewController as! DetailController
            
            //エントリーを設定する
            detailContoroller.entry = sender as! NSDictionary
        }
    }

    @IBAction func reflesh(sender: AnyObject) {
        // NSURL を作る
        var url = NSURL(string: newsUrlString)!
        
        // データをダウンロードする
        var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {
            data, response, error in
            // JSONデータを辞書に変換する
            var dict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
            
            // /response/feed/entriesを取得
            if var responseData = dict["responseData"] as? NSDictionary {
                if var feed = responseData["feed"] as? NSDictionary {
                    if var entries = feed["entries"] as? NSArray {
                        // エントリーの配列を設定する
                        self.entries = entries
                    }
                }
            }
        })
        task.resume()
        
        // テーブルビューを更新するため、メインスレッドにスイッチする
        dispatch_async(dispatch_get_main_queue(), {
            // テーブルビューの更新をする
            self.tableView.reloadData()
        })
    }
}

