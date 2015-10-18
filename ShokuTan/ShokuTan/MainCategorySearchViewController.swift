//
//  MainCategorySearchViewController.swift
//  ShokuTan
//
//  Created by kyohei on 2015/10/18.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import RealmSwift

class MainCategorySearchViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var main_category_table_view: UITableView!
    // メインカテゴリデータ
    var main_category_items: RealmSwift.Results<MainCategory>!
    
    /**
     * xib読み込み
     */
    override func loadView() {
        if let view = UINib(nibName: "MainCategorySearchViewController", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // カスタムセル読み込み
        let nib = UINib(nibName: "MainCategoryCustomCell", bundle: nil)
        self.main_category_table_view.registerNib(nib, forCellReuseIdentifier: "MainCategoryCustomCell")
        
        // メインカテゴリデータ取得
        main_category_items = self.appdelegate.search_realm.objects(MainCategory)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return main_category_items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.main_category_table_view.dequeueReusableCellWithIdentifier("MainCategoryCustomCell", forIndexPath: indexPath) as! MainCategoryCustomCell
        // ラベルを設定
        let obj_main_category: MainCategory = main_category_items[indexPath.row] as MainCategory
        cell.custom_label.text = obj_main_category.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let obj_main_category: MainCategory = main_category_items[indexPath.row] as MainCategory
        print("\(obj_main_category.code)")
        print("\(obj_main_category.name)")
    }
}
