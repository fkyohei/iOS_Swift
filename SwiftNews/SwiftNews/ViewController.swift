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
    let newsUrlString = "http://www.apple.com"

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
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セルを取得する
        var cell = tableView.dequeueReusableCellWithIdentifier("news") as! UITableViewCell
        
        // セルにテキストを設定する
        cell.textLabel!.text = "Swift News"
        
        return cell
    }

    @IBAction func reflesh(sender: AnyObject) {
        // NSURL を作る
        var url = NSURL(string: newsUrlString)!
        
        // データをダウンロードする
        var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {
            data, response, error in
            // ダウンロードサイズを表示する（テスト用）
            println("done, length \(data.length)")
        })
        task.resume()
    }
}

