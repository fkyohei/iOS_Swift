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

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func set_nav_title(str_title :String, int_width:Int, int_height:Int) -> UILabel{
        let title_label = UILabel()
        title_label.frame         = CGRectMake(0, 0, CGFloat(int_width), CGFloat(int_height))
        title_label.font          = UIFont(name:"HiraginoSans-W6", size:15)!
        title_label.textColor     = UIColor.blackColor()
        title_label.textAlignment = NSTextAlignment.Center
        title_label.text          = str_title
        return title_label
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
