//
//  InitAreaViewController.swift
//  ShokuTan
//
//  Created by kyohei on 2015/10/24.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import RealmSwift

class InitAreaViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var init_area_table_view: UITableView!
    // エリアデータ
    var area_items: RealmSwift.Results<Area>!
    
    /**
     * xib読み込み
     */
    override func loadView() {
        if let view = UINib(nibName: "InitAreaViewController", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ナビゲーションタイトルを変更
        self.navigationItem.title = "エリア選択"

        // カスタムセル読み込み
        let nib = UINib(nibName: "AreaCustomCell", bundle: nil)
        self.init_area_table_view.registerNib(nib, forCellReuseIdentifier: "AreaCustomCell")
        
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
        let cell = self.init_area_table_view.dequeueReusableCellWithIdentifier("AreaCustomCell", forIndexPath: indexPath) as! AreaCustomCell
        // ラベルを設定
        let obj_area: Area = self.area_items[indexPath.row] as Area
        cell.custom_label.text = obj_area.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let obj_area: Area = self.area_items[indexPath.row] as Area
        
        // 選択したエリアを保存
        UDWrapper.setString("area_code", value: obj_area.code)
        UDWrapper.setString("area_name", value: obj_area.name)
        
        // 都道府県選択画面に遷移
        performSegueWithIdentifier("toInitPrefView", sender: self)
    }
}
