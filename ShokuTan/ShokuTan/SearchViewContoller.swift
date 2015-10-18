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
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     * エリアから探す
     */
    @IBAction func area_search_btn(sender: AnyObject) {
        self.performSegueWithIdentifier("toAreaSearchView", sender: self)
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

}
