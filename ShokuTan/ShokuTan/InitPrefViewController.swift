//
//  InitPrefViewController.swift
//  ShokuTan
//
//  Created by kyohei on 2015/10/24.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import RealmSwift

class InitPrefViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var init_pref_table_view: UITableView!
    // 都道府県データ
    var pref_items: RealmSwift.Results<Pref>!
    
    /**
     * xib読み込み
     */
    override func loadView() {
        if let view = UINib(nibName: "InitPrefViewController", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // アプリコード読み込み
        self.appdelegate.app_code.get_data()

        // カスタムセル読み込み
        let nib = UINib(nibName: "PrefCustomCell", bundle: nil)
        self.init_pref_table_view.registerNib(nib, forCellReuseIdentifier: "PrefCustomCell")
        
        // ナビゲーションタイトルを変更
        self.navigationItem.titleView = self.set_nav_title("都道府県選択", int_width: 90, int_height: 44)
        
        // 都道府県データ取得
        let area_code = self.appdelegate.app_code.area_code
        self.pref_items = self.get_pref_data(area_code!)
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
        return self.pref_items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.init_pref_table_view.dequeueReusableCellWithIdentifier("PrefCustomCell", forIndexPath: indexPath) as! PrefCustomCell
        // ラベルを設定
        let obj_pref: Pref = self.pref_items[indexPath.row] as Pref
        cell.custom_label.text = obj_pref.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let obj_pref: Pref = self.pref_items[indexPath.row] as Pref
        
        // 選択した都道府県を保存
        UDWrapper.setString("pref_code", value: obj_pref.code)
        UDWrapper.setString("pref_name", value: obj_pref.name)
        
        // 検索画面に遷移
        performSegueWithIdentifier("toSearchView", sender: self)
    }
    
    @IBAction func back_view(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
