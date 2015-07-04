//
//  DetailController.swift
//  SwiftNews
//
//  Created by 藤崎 恭平 on 2015/06/17.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import Social

class DetailController: UIViewController {
    @IBOutlet var webView: UIWebView!

    // エントリー
    var entry = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // webビューでURLを読み込む
        var url = NSURL(string: self.entry["link"] as! String)!
        var request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
    
    @IBAction func twitter(sender: AnyObject) {
        // Twitterへの投稿が行えるか確認
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            // コントローラを作る
            var controller = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            // リンクを追加
            var link = entry["link"] as! String
            var url = NSURL(string: link)
            controller.addURL(url)
            
            // テキストを追加
            var title = entry["title"] as! String
            controller.setInitialText(title)
            
            presentViewController(controller, animated: true, completion: {})
        }
    }
    
    @IBAction func facebook(sender: AnyObject) {
        // Facebookはの投稿が行えるか確認
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            // コントローラーを作る
            var controller = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            // リンクを追加
            var link = entry["link"] as! String
            var url = NSURL(string: link)
            controller.addURL(url)
            
            // テキストを追加
            var title = entry["title"] as! String
            controller.setInitialText(title)
            
            presentViewController(controller, animated: true, completion: {})
        }
    }
}