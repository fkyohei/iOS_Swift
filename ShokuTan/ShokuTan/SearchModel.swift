//
//  AreaModel.swift
//  ShokuTan
//
//  Created by kyohei on 2015/11/01.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit
import RealmSwift

class SearchModel: BaseModel {
    // アプリコード
    var app_code: AppCode = AppCode()
    
    override init() {
        super.init()
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
    func get_pref_data() -> RealmSwift.Results<Pref> {
        let area_code = self.app_code.area_code
        if area_code != "" {
            let predicate = NSPredicate(format: "areacode = %@", area_code!)
            return self.appdelegate.search_realm.objects(Pref).filter(predicate)
        }
        
        return self.appdelegate.search_realm.objects(Pref)
    }
    
    /**
    * Lエリア取得
    *
    * @param string pref_code 都道府県コード
    */
    func get_areal_data() -> RealmSwift.Results<Area_L> {
        let pref_code = self.app_code.pref_code
        if pref_code != "" {
            let predicate = NSPredicate(format: "prefcode = %@", pref_code!)
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
    * サブカテゴリ取得
    *
    * @param string main_category_code メインカテゴリコード
    */
    func get_sub_category_data() -> RealmSwift.Results<SubCategory> {
        let main_category_code = self.app_code.main_category_code
        if main_category_code != "" {
            let predecate = NSPredicate(format: "maincode = %@", main_category_code!)
            return self.appdelegate.search_realm.objects(SubCategory).filter(predecate)
        }
        
        return  self.appdelegate.search_realm.objects(SubCategory)
    }
    
    
    /**
    * こだわり全取得
    */
    func get_option_data() -> RealmSwift.Results<Option> {
        let option_items = self.appdelegate.search_realm.objects(Option)
        
        return option_items
    }
}
