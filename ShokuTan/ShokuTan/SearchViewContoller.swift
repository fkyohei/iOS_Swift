//
//  SearchViewContoller.swift
//  ShokuTan
//
//  Created by kyohei on 2015/10/18.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class SearchViewContoller: BaseViewController, UITextFieldDelegate {
    // フリーワード検索
    @IBOutlet weak var freeword_text_field: UITextField!
    
    /**
     * xib読み込み
     */
    override func loadView() {
        if let view = UINib(nibName: "SearchViewController", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // フリーワード検索フォームのデリゲートをセット
        freeword_text_field.delegate = self
        
        // アプリコード読み込み
        self.appdelegate.app_code.get_data()
        
        self._set_custom_bar()
    }
    
    /**
     * 場所から探す
     */
    @IBAction func area_search_btn(sender: AnyObject) {
        
        self.performSegueWithIdentifier("toAreaLSearchView", sender: self)
    }
    
    /**
     * カテゴリから探す
     */
    @IBAction func category_search_btn(sender: AnyObject) {
        self.performSegueWithIdentifier("toMainCategorySearchView", sender: self)
    }
    
    /**
     * こだわりから探す
     */
    @IBAction func option_search_btn(sender: AnyObject) {
        self.performSegueWithIdentifier("toOptionSearchView", sender: self)
    }
    
    /**
     * フリーワード検索改行ボタン押下
     */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
    }
    
    /**
     * ナビゲーションバー・タブバーのセット
     */
    func _set_custom_bar() {
        // ナビゲーションバータイトルセット
        let pref_name = self.appdelegate.app_code.pref_name
        self.navigationItem.titleView = self.set_nav_title("\(pref_name!)で食探", int_width: 90, int_height: 44)

        // ナビゲーションバー戻るボタン非表示
        self.navigationItem.hidesBackButton = true
        // ナビゲーションバー左側ボタンセット
        let change_area_btn = UIBarButtonItem(title: "エリア変更", style: UIBarButtonItemStyle.Plain, target: self, action: "change_area_btn:")
        self.navigationItem.setLeftBarButtonItem(change_area_btn, animated: true)
        
        // タブバー表示
        self.tabBarController?.tabBar.hidden = false
    }
    
    /**
     * エリア変更ボタン
     */
    func change_area_btn(sender: UIButton) {
        // エリア設定画面に遷移
        self.navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
