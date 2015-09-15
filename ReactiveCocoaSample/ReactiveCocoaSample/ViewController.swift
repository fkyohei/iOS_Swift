//
//  ViewController.swift
//  ReactiveCocoaSample
//
//  Created by 藤崎 恭平 on 2015/08/06.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewController: UIViewController {

    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var updateLable: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var ValidUsernameSignal = UsernameField
                            .rac_textSignal()
                            .map {self.isValidUserName($0)}

        var ValidPasswordSignal = PasswordField
                            .rac_textSignal()
                            .map {self.isValidPassWord($0)}
        
        RAC(self.UsernameField, "backgroundColor") <~ ValidUsernameSignal.map(self.colorForValidity)
        ValidPasswordSignal.map(self.colorForValidity) ~> RAC(PasswordField, "backgroundColor")
        
        button.rac_signalForControlEvents(UIControlEvents.TouchUpInside)
            .doNext {
                _ in
                self.button.enabled = false
                self.updateLable.hidden = true
            .flattenMap(self.signInSignal)
            .subscribeNext {
                let success = $0 as Bool
                self.button.enabled = true
                self.updateLable.hidden = success
                println("Sign in result: \(success)")
                if success {
                    self.performSegueWithIdentifier("signInSuccess", sender: self)
                }
            }
        }
        
    }
    
    func isValidUserName(name: AnyObject!) -> NSNumber! {
        return (name as! NSString).length > 10
    }
    
    func isValidPassWord(pass: AnyObject!) -> NSNumber! {
        return (pass as! NSString).length > 8
    }
    
    func colorForValidity(valid: AnyObject!) -> UIColor! {
        return (valid as! Bool) ? UIColor.clearColor() : UIColor.yellowColor()
    }
    
    func signInSignal(_ : AnyObject!) -> RACSignal {
        return RACSignal.createSignal {
            subscriber in
            signupActiveSignal(self.UsernameField.text, password: self.PasswordField.text) {
                subscriber.sendNext($0)
                subscriber.sendCompleted()
            }
            return nil
        }
    }
    
    let signupActiveSignal =  RACSignal.combineLatest([self.validUsernameSignal, self.validPasswordSignal]).map {
        let tuple = $0 as RACTuple
        let bools = tuple.allObjects() as [Bool]
        return bools.reduce(true) {$0 && $1}
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

