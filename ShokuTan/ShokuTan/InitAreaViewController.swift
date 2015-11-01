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
    // 検索モデル
    var search_model: SearchModel = SearchModel()
    
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
        
        // カスタムセル読み込み
        let nib = UINib(nibName: "AreaCustomCell", bundle: nil)
        self.init_area_table_view.registerNib(nib, forCellReuseIdentifier: "AreaCustomCell")
        
        // ナビゲーションタイトルを変更
        self.navigationItem.titleView = self.set_nav_title("エリア選択", int_width: 90, int_height: 44)
        
        self.area_items = self.search_model.get_area_data()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // タブバー非表示
        self.tabBarController?.tabBar.hidden = true
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
