//
//  AppDelegate.swift
//  ShokuTan
//
//  Created by kyohei on 2015/10/17.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import Realm
import RealmSwift



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    // アプリコード
    var app_code: AppCode!
    
    // 検索条件
    var search_realm: Realm!
    // ユーザ記録(お気に入り・履歴)
    var user_realm: Realm!
    
    class func sharedAppDelegate() -> AppDelegate {
        let sharedAppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return sharedAppDelegate
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        do {
            // アプリコード読み込み
            self.app_code = AppCode.init()
            
            // 検索条件読み込み
            let realm_path = NSBundle.mainBundle().pathForResource("ShokuTan_v1", ofType:"realm")
            let realm_config = Realm.Configuration(path: realm_path, readOnly: true)
            self.search_realm = try Realm(configuration: realm_config)
            
            // ユーザ記録（お気に入り・履歴）
            self.user_realm = try Realm()
            
            // 画面初期化
            self.initViewController()
            
            Fabric.with([Crashlytics.self])
            return true
            
        } catch let error as NSError {
            print(error)
            return false
        }
    }
    
    /**
     * 画面の初期化
     */
    func initViewController() {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        let init_tab = storyboard.instantiateViewControllerWithIdentifier("init_tab_controller") as! UITabBarController
        let search_nav = storyboard.instantiateViewControllerWithIdentifier("search_nav_controller") as! UINavigationController
        
        
        // 都道府県が選択済みの場合
        if self.app_code.pref_code != "" {
            let init_area_view_controller = storyboard.instantiateViewControllerWithIdentifier("init_area_view_controller") as! InitAreaViewController
            let init_pref_view_controller = storyboard.instantiateViewControllerWithIdentifier("init_pref_view_controller") as! InitPrefViewController
            let search_view_controller = storyboard.instantiateViewControllerWithIdentifier("search_view_controller") as! SearchViewContoller
            
            search_nav.viewControllers = [init_area_view_controller, init_pref_view_controller, search_view_controller]
            init_tab.viewControllers?[0] = search_nav
            
        } else {
            let init_area_view_controller = storyboard.instantiateViewControllerWithIdentifier("init_area_view_controller") as! InitAreaViewController
            
            search_nav.viewControllers = [init_area_view_controller]
            init_tab.viewControllers?[0] = search_nav
        }
        
        self.window?.rootViewController = init_tab
        self.window?.makeKeyAndVisible()
    }
    
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

