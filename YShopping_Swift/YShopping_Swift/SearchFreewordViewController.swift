//
//  SearchFreewordViewController.swift
//  YShopping_Swift
//
//  Created by 藤崎 恭平 on 2015/07/02.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class SearchFreewordViewController: UIViewController {
    // AppDelegateのインスタンス変数
    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    @IBOutlet weak var freewordfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        // 入力されているテキスト表示
        freewordfield.text = appDelegate.strFreeword
    }
    
    @IBAction func addBtn(sender: AnyObject) {
        // 入力したテキストを保存
        appDelegate.strFreeword = freewordfield.text
        // Viewの移動する
        self.navigationController?.popViewControllerAnimated(true)
        
    }
}