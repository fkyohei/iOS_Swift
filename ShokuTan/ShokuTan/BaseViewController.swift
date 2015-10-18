//
//  BaseViewController.swift
//  ShokuTan
//
//  Created by kyohei on 2015/10/18.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import RealmSwift

class BaseViewController: UIViewController, UITabBarControllerDelegate {
    var appdelegate: AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.appdelegate = AppDelegate.sharedAppDelegate()
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
       let index = tabBarController.selectedIndex
        
        switch index {
        case 0:
            tabBarController.selectedIndex = 0
            break
        case 1:
            tabBarController.selectedIndex = 1
            break
        case 2:
            tabBarController.selectedIndex = 2
            break
        case 3:
            tabBarController.selectedIndex = 3
            break
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
