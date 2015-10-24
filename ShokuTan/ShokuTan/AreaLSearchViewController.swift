//
//  AreaLSearchViewController.swift
//  ShokuTan
//
//  Created by kyohei on 2015/10/24.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import RealmSwift

class AreaLSearchViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var areal_table_view: UITableView!
    // Lエリアデータ
    var areal_items: RealmSwift.Results<Area_L>!

    /**
     * xib読み込み
     */
    override func loadView() {
        if let view = UINib(nibName: "AreaLSearchViewController", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // アプリコード読み込み
        self.appdelegate.app_code.get_data()

        // カスタムセル読み込み
        let nib = UINib(nibName: "AreaLCustomCell", bundle: nil)
        self.areal_table_view.registerNib(nib, forCellReuseIdentifier: "AreaLCustomCell")
        
        // ナビゲーションタイトルを変更
        self.navigationItem.titleView = self.set_nav_title("エリア選択", int_width: 90, int_height: 44)
        
        // Lエリアデータ取得
        let pref_code = self.appdelegate.app_code.pref_code
        self.areal_items = self.get_areal_data(pref_code!)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.areal_items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.areal_table_view.dequeueReusableCellWithIdentifier("AreaLCustomCell", forIndexPath: indexPath) as! AreaLCustomCell
        // ラベルを設定
        let obj_area: Area_L = self.areal_items[indexPath.row] as Area_L
        cell.custom_label.text = obj_area.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let obj_area: Area_L = self.areal_items[indexPath.row] as Area_L
        print("\(obj_area.code)")
        print("\(obj_area.name)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
