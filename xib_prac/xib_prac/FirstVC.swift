//
//  FirstVC.swift
//  xib_prac
//
//  Created by 藤崎 恭平 on 2015/09/15.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    /**
     * xibファイル読み込み
     */
    override func loadView() {
        if let view = UINib(nibName: "FirstView", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
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

    @IBAction func btnAClick(sender: AnyObject) {
        performSegueWithIdentifier("buttonA", sender: self)
    }

    @IBAction func btnBClick(sender: AnyObject) {
        performSegueWithIdentifier("buttonB", sender: self)
    }
}

