//
//  ViewController.swift
//  SwiftNews
//
//  Created by 藤崎 恭平 on 2015/06/17.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    // ニュースのアドレスの配列
    let newsUrlStrings = ["http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.rssad.jp/rss/impresswatch/pcwatch.rdf&num=8",
                          "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.itmedia.co.jp/rss/2.0/news_bursts.xml&num=8",
                          "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://jp.techcrunch.com/feed/&num=8",
    ]
    // エントリーの配列
    var entries = NSMutableArray()
    // 画像ファイル名の配列
    let imageNames = ["itmedia", "pcwatch", "techcrunch"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getdata()
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

        // タイトルラベルを取得して、タイトルを設定する
        var titleLabel = cell?.viewWithTag(1) as! UILabel
        titleLabel.text = entry["title"] as? String
        
        // 本文ラベルを取得して、本文を設定する
        var discriptionLabel = cell?.viewWithTag(2) as! UILabel
        discriptionLabel.text = entry["contentSnippet"] as? String
        
        // 日付ラベルを取得して、日付を設定する
        var dateLabel = cell?.viewWithTag(3) as! UILabel
        dateLabel.text = entry["publishedDate"] as? String
        
        // 画像ファイル名を決定して、UIImageを作る
        var urlString = entry["url"] as? String
        var index = find(newsUrlStrings, urlString!)
        var imageName = imageNames[index!]
        var image = UIImage(named: imageName)
        
        // イメージビューを取得して、画像を設定する
        var imageView = cell?.viewWithTag(4) as! UIImageView
        imageView.image = image

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
        getdata()
    }
    
    func getdata() {
        // エントリーを全て削除する
        entries.removeAllObjects()
        
        // ニュースサイトの配列からアドレスを取り出す
        for newsUrlString in newsUrlStrings {
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
                            // NSDateFormatterのインスタンスを作成
                            var formatter = NSDateFormatter()
                            formatter.locale = NSLocale(localeIdentifier: "en-US")
                            formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzzz"
                            
                            // エントリーに情報を追加する
                            for var i = 0; i < entries.count; i++ {
                                // エントリーを取り出す
                                var entry = entries[i] as! NSMutableDictionary
                                
                                // ニュースサイトのURLを追加する
                                entry["url"] = newsUrlString
                                
                                // NSDate型の日付を追加する
                                var dateStr = entry["publishedDate"] as! String
                                var date = formatter.dateFromString(dateStr)
                                entry["date"] = date
                            }
                            
                            // エントリーを配列に追加する
                            self.entries.addObjectsFromArray(entries as [AnyObject])
                            
                            // エントリーをソートする
                            self.entries.sortUsingComparator({ object1, object2 in
                                // 日付を取得する
                                var date1 = object1["date"] as! NSDate
                                var date2 = object2["date"] as! NSDate
                                
                                // 日付を比較する
                                var order = date1.compare(date2)
                                
                                // 比較結果をひっくり返す
                                if order == NSComparisonResult.OrderedAscending {
                                    return NSComparisonResult.OrderedDescending
                                } else if order == NSComparisonResult.OrderedDescending {
                                    return NSComparisonResult.OrderedAscending
                                }
                                return order
                            })
                            
                        }
                    }
                }
                // テーブルビューを更新するため、メインスレッドにスイッチする
                dispatch_async(dispatch_get_main_queue(), {
                    // テーブルビューの更新をする
                    self.tableView.reloadData()
                })
            })
            task.resume()
        }
    }
}

