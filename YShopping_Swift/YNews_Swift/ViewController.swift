//
//  ViewController.swift
//  YNews_Swift
//
//  Created by 藤崎 恭平 on 2015/06/24.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    // ニュースのアドレス
    let newsUrlString = "http://www.apple.com"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getdata()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // テーブル行数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: データ取得できるようになったら、取得件数に変更
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セルを取得
        var cell = tableView.dequeueReusableCellWithIdentifier("news") as? UITableViewCell
        
        cell?.textLabel?.text = "test"
        
        // セル返却
        return cell!
    }
    
    func getdata() {
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
    
    @IBAction func searchBtn(sender: AnyObject) {
    }
    
    
}

