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
        
        // こだわりデータ取得
        self.option_items = self.appdelegate.search_realm.objects(Option)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let obj_option: Option = self.option_items[indexPath.row] as Option
        print("\(obj_option.code)")
        print("\(obj_option.name)")
    }
}
