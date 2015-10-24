//
//  AreaSearchViewController.swift
//  ShokuTan
//
//  Created by kyohei on 2015/10/18.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import RealmSwift

class AreaSearchViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var area_table_view: UITableView!
    // エリアデータ
    var area_items: RealmSwift.Results<Area>!

    /**
     * xib読み込み
     */
    override func loadView() {
        if let view = UINib(nibName: "AreaSearchViewController", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ナビゲーションタイトルを変更
        self.navigationItem.title = "エリア選択"

        // カスタムセル読み込み
        let nib = UINib(nibName: "AreaCustomCell", bundle: nil)
        self.area_table_view.registerNib(nib, forCellReuseIdentifier: "AreaCustomCell")
        
        // エリアデータ取得
        self.area_items = self.get_area_data()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.area_items.count
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.area_table_view.dequeueReusableCellWithIdentifier("AreaCustomCell", forIndexPath: indexPath) as! AreaCustomCell
        // ラベルを設定
        let obj_area: Area = self.area_items[indexPath.row] as Area
        cell.custom_label.text = obj_area.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let obj_area: Area = self.area_items[indexPath.row] as Area
        print("\(obj_area.code)")
        print("\(obj_area.name)")
    }
}