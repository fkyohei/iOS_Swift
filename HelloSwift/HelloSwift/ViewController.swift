//
//  ViewController.swift
//  HelloSwift
//
//  Created by 藤崎 恭平 on 2015/06/17.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func sayHello(sender: AnyObject) {
        textField.text = "Hello Swift!"
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

