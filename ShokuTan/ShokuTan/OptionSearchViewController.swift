//
//  OptionSearchViewController.swift
//  ShokuTan
//
//  Created by kyohei on 2015/10/18.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import RealmSwift

class OptionSearchViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var option_table_view: UITableView!
    // こだわりデータ
    var option_items: RealmSwift.Results<Option>!
    // 検索モデル
    var search_model: SearchModel = SearchModel()
    
    /**
     * xib読み込み
     */
    override func loadView() {
        if let view = UINib(nibName: "OptionSearchViewController", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // カスタムセル読み込み
        let nib = UINib(nibName: "OptionCustomCell", bundle: nil)
        self.option_table_view.registerNib(nib, forCellReuseIdentifier: "OptionCustomCell")
        
        // ナビゲーションタイトルを変更
        self.navigationItem.titleView = self.set_nav_title("こだわり選択", int_width: 90, int_height: 44)
        
        // こだわりデータ取得
        self.option_items = self.search_model.get_option_data()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.option_items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.option_table_view.dequeueReusableCellWithIdentifier("OptionCustomCell", forIndexPath: indexPath) as! OptionCustomCell
        // ラベル設定
        let obj_option: Option = self.option_items[indexPath.row] as Option
        cell.custom_cell.text = obj_option.name

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // セルのチェック状態変更
        self._change_cell_status(tableView, indexPath: indexPath)
        
        // 選択した項目
        let obj_option: Option = self.option_items[indexPath.row] as Option
        print("\(obj_option.code)")
        print("\(obj_option.name)")
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        // セルのチェック状態変更
        self._change_cell_status(tableView, indexPath: indexPath)
        
        // 選択した項目
        let obj_option: Option = self.option_items[indexPath.row] as Option
        print("\(obj_option.code)")
        print("\(obj_option.name)")
    }
    
    /**
     * セルの選択状態を変更
     */
    func _change_cell_status(tableView: UITableView, indexPath: NSIndexPath) {
        // 選択したセルを取得
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! OptionCustomCell
        // チェックの状態を反転
        if cell.is_checked == true {
            cell.tintColor  = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1.0)
        } else {
            cell.tintColor  = UIColor.orangeColor()
        }
        cell.is_checked = !cell.is_checked
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
