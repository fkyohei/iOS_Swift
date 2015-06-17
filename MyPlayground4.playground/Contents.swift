//: Playground - noun: a place where people can play

// テーブル
// サンプル通りなのに動かない

import UIKit

class MyController: UITableViewController {
    let iphones = [ "iPhone",
                    "iPhone 3G",
                    "iPhone 4",
                    "iPhone 4s",
                    "iPhone 5",
                    "iPhone 5s",
                    "iPhone 5c",
                    "iPhone 6",
                    "iPhone 6 Plus"]
    let years = [ "2007",
                  "2008",
                  "2010",
                  "2011",
                  "2012",
                  "2013",
                  "2013",
                  "2014",
                  "2014"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//         セルのクラスを設定する
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // テーブルの行数を返す
        return iphones.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セルを取得する
//        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
        
        // セルにテキストを設定する
        cell.textLabel?.text = iphones[indexPath.row]
        cell.detailTextLabel?.text = years[indexPath.row]
        
        return cell
    }
}

var controller = MyController()
controller.view