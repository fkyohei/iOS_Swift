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
    
    func set_nav_title(str_title :String, int_width:Int, int_height:Int) -> UILabel{
        let title_label = UILabel()
        title_label.frame         = CGRectMake(0, 0, CGFloat(int_width), CGFloat(int_height))
        title_label.font          = UIFont(name:"HiraginoSans-W6", size:15)!
        title_label.textColor     = UIColor.blackColor()
        title_label.textAlignment = NSTextAlignment.Center
        title_label.text          = str_title
        return title_label
    }
    
    /**
     * エリア全取得
     */
    func get_area_data() -> RealmSwift.Results<Area> {
        let area_items = self.appdelegate.search_realm.objects(Area)

        return area_items
    }
    
    /**
     * 都道府県取得
     *
     * @param string area_code エリアコード
     */
    func get_pref_data(area_code: String = "") -> RealmSwift.Results<Pref> {
        if area_code != "" {
            let predicate = NSPredicate(format: "areacode = %@", area_code)
            return self.appdelegate.search_realm.objects(Pref).filter(predicate)
        }
        
        return self.appdelegate.search_realm.objects(Pref)
    }
    
    /**
     * Lエリア取得
     *
     * @param string pref_code 都道府県コード
     */
    func get_areal_data(pref_code: String = "") -> RealmSwift.Results<Area_L> {
        if pref_code != "" {
            let predicate = NSPredicate(format: "prefcode = %@", pref_code)
            return self.appdelegate.search_realm.objects(Area_L).filter(predicate)
        }
        
        return  self.appdelegate.search_realm.objects(Area_L)
    }
    
    /**
     * メインカテゴリ全取得
     */
    func get_main_category_data() -> RealmSwift.Results<MainCategory> {
        let main_category_items = self.appdelegate.search_realm.objects(MainCategory)
        
        return main_category_items
    }
    
    /**
     * こだわり全取得
     */
    func get_option_data() -> RealmSwift.Results<Option> {
        let option_items = self.appdelegate.search_realm.objects(Option)
        
        return option_items
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
