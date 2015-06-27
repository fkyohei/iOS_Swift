//
//  DetailViewController.swift
//  YShopping_Swift
//
//  Created by kyohei on 2015/06/27.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var webView: UIWebView!

    // 詳細データ
    var detailData = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // webビューでURLを読み込む
        var detailUrl = self.detailData["Url"] as? String
        var url = NSURL(string: detailUrl!)
        var request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
        // web内スワイプイベント
        self.setupSwipeGestures()
    }
    
    func setupSwipeGestures() {
        // 右方向へのスワイプ
        let gestureToRight = UISwipeGestureRecognizer(target: self, action: "goBack")
        gestureToRight.direction = UISwipeGestureRecognizerDirection.Right
        self.webView.addGestureRecognizer(gestureToRight)
        
        // 左方向へのスワイプ
        let gestureToLeft = UISwipeGestureRecognizer(target: self, action: "goForward")
        gestureToLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.webView.addGestureRecognizer(gestureToLeft)
    }
    
    func goBack() {
        if (self.webView.canGoBack) {
            self.webView.goBack()
        } else {
            // canGoBack == false の処理
            // 何もしない
        }
    }
    
    func goForward() {
        if (self.webView.canGoForward) {
            self.webView.goForward()
        } else {
            // canGoForward == false の処理
            // 何もしない
        }
    }
}