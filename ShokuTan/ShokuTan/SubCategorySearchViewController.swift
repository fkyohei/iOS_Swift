//
//  SubCategorySearchViewController.swift
//  ShokuTan
//
//  Created by kyohei on 2015/10/25.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import RealmSwift

class SubCategorySearchViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var sub_category_table_view: UITableView!
    // サブカテゴリデータ
    var sub_category_items: RealmSwift.Results<SubCategory>!
    // 検索モデル
    var search_model: SearchModel = SearchModel()
    
    /**
     * xib読み込み
     */
    override func loadView() {
        if let view = UINib(nibName: "SubCategorySearchViewController", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カスタムセル読み込み
        let nib = UINib(nibName: "SubCategoryCustomCell", bundle: nil)
        self.sub_category_table_view.registerNib(nib, forCellReuseIdentifier: "SubCategoryCustomCell")
        
        // ナビゲーションタイトルを変更
        self.navigationItem.titleView = self.set_nav_title("サブカテゴリ選択", int_width: 90, int_height: 44)
        
        // サブカテゴリデータ取得
        self.sub_category_items = self.search_model.get_sub_category_data()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sub_category_items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.sub_category_table_view.dequeueReusableCellWithIdentifier("SubCategoryCustomCell", forIndexPath: indexPath) as! SubCategoryCustomCell
        // ラベルを設定
        let obj_sub_category: SubCategory = self.sub_category_items[indexPath.row] as SubCategory
        cell.custom_cell.text = obj_sub_category.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let obj_sub_category: SubCategory = self.sub_category_items[indexPath.row] as SubCategory
        print("\(obj_sub_category.code)")
        print("\(obj_sub_category.name)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
