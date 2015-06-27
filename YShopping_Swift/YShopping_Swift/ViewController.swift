//
//  ViewController.swift
//  YShopping_Swift
//
//  Created by kyohei on 2015/06/27.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    // ニュースのアドレス
    let newsUrlString = "http://www.apple.com"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // テーブル行数
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("shopping") as? UITableViewCell
        
        cell?.textLabel?.text = "shop"
        
        return cell!
    }
    
    func getData() {
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

