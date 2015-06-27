//
//  ViewController.swift
//  YShopping_Swift
//
//  Created by kyohei on 2015/06/27.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//


import UIKit


class ViewController: UITableViewController {
    // YahooショッピングAPIのアドレス
    let ApiBaseUrlString = "http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch?appid=dj0zaiZpPW54Tm5pOExlV05vcSZzPWNvbnN1bWVyc2VjcmV0Jng9Y2Y-&image_size=106&category_id=1"
    // 取得データ配列
    var resultData = NSMutableArray()
    // 取得データ開始件数
    var offset = 0
    // 読み込み中フラグ
    var isLoading = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // データ取得
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // テーブル行数
        return resultData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セル取得
        var cell = tableView.dequeueReusableCellWithIdentifier("shopping") as? UITableViewCell
        
        // データを取得
        var data = resultData[indexPath.row] as! NSDictionary
        
        // 商品名ラベルを取得して、タイトルを設定する
        var titleLabel = cell?.viewWithTag(1) as! UILabel
        titleLabel.text = data["Name"] as? String
        
        // カテゴリ名ラベルを取得して、カテゴリ名を設定する
        var categoryLabel = cell?.viewWithTag(2) as! UILabel
        var category = data["Category"] as! NSDictionary
        var categoryCurrent = category["Current"] as! NSDictionary
        categoryLabel.text = categoryCurrent["Name"] as? String
        
        // 値段ラベルを取得して、値段を設定する
        var priceLabel = cell?.viewWithTag(3) as! UILabel
        var price = data["Price"] as! NSDictionary
        var pricetext = price["_value"] as! String
        priceLabel.text = "\(pricetext)円"
        
        // 店名ラベルを取得して、店名を設定する
        var storeLabel = cell?.viewWithTag(4) as! UILabel
        var store = data["Store"] as! NSDictionary
        storeLabel.text = store["Name"] as? String
        
        // 商品画像ラベルを取得して、商品画像を設定する
        var imageLabel = cell?.viewWithTag(5) as! UIImageView
//        if var eximage = data["ExImage"] as? NSDictionary {
//            var imageUrl = NSURL(string: (data["Url"] as? String)!)
//            var imageData = NSData(contentsOfURL: imageUrl!,options: NSDataReadingOptions.DataReadingMappedIfSafe, error: nil)!
//            imageLabel.image = UIImage(data:imageData)
//        } else {
            imageLabel.image = UIImage(named: "noimage")
//        }
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // セグエを実行
        performSegueWithIdentifier("detail", sender: resultData[indexPath.row])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // detailセグエの場合
        if segue.identifier == "detail" {
            // DetailControllerを取得
            var detailViewController = segue.destinationViewController as! DetailViewController

            // データを設定する
            detailViewController.detailData = sender as! NSDictionary
        }
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        var contentOffsetWidthWindow = self.tableView.contentOffset.y + self.tableView.bounds.size.height
        var eachToBottom = contentOffsetWidthWindow >= self.tableView.contentSize.height
        // ページ最下部でないまたは読み込み中はなにもしない
        if (!eachToBottom || self.isLoading) {
            return;
        }
        // ロード中画像を表示し、フラグをtrueに
        self.isLoading = true
        SVProgressHUD.show()
        // 次のデータ取得
        getData()
    }
    
    func getData() {
        // NSURL を作る
        var ApiUrlString = "\(ApiBaseUrlString)&offset=\(offset)"
        var url = NSURL(string: ApiUrlString)!
        
        // データをダウンロードする
        var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {
            data, response, error in

            // jsonデータを辞書に変換する
            var dictData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
            
            // /ResultSet/0/Resultを取得
            if var resultset = dictData["ResultSet"] as? NSDictionary {
                if var resultset0 = resultset["0"] as? NSDictionary {
                    if var result = resultset0["Result"] as? NSDictionary {
                        for (data_key, data_value) in result {
//                            println("***********\(data_key)")
//                            println(data_value)
//                            println("***************")
                            if data_key as! String == "Request" {
                                continue
                            }
                            if data_value["Name"] != nil {
                                self.resultData.addObject(data_value)
                            }
                        }
                        
                    }
                }
                // 取得件数更新
                self.offset += resultset["totalResultsReturned"] as! Int
            }
            
            // テーブルビューを更新するため、メインスレッドにスイッチする
            dispatch_async(dispatch_get_main_queue(), {
                // 読み込み中画像を非表示にし、フラグをfalseに
                SVProgressHUD.dismiss()
                self.isLoading = false
                // テーブルビューの更新をする
                self.tableView.reloadData()
            })
        })
        task.resume()
        
    }


    @IBAction func searchBtn(sender: AnyObject) {
        // セグエを実行
        performSegueWithIdentifier("search", sender: nil)
    }
}

