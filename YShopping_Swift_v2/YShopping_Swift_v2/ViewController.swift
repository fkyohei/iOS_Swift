//
//  ViewController.swift
//  YShopping_Swift_v2
//
//  Created by kyohei on 2015/10/17.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /** 
     * xib読み込み
     */
    override func loadView() {
        if let view = UINib(nibName: "ViewController" , bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

