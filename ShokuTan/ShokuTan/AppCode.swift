//
//  AppCode.swift
//  ShokuTan
//
//  Created by kyohei on 2015/10/24.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import Foundation

class AppCode: NSObject {
    var area_code: String? = ""
    var area_name: String? = ""
    
    var pref_code: String? = ""
    var pref_name: String? = ""
    
    var main_category_code: String? = ""
    var main_category_name: String? = ""
    
    override init() {
        super.init()
        get_data()
    }
    
    /**
     * ユーザ固有データ取得
     */
    func get_data() {
        self.area_code = UDWrapper.getString("area_code", defaultValue: "")
        self.area_name = UDWrapper.getString("area_name", defaultValue: "")
        
        self.pref_code = UDWrapper.getString("pref_code", defaultValue: "")
        self.pref_name = UDWrapper.getString("pref_name", defaultValue: "")
        
        self.main_category_code = UDWrapper.getString("main_category_code", defaultValue: "")
        self.main_category_name = UDWrapper.getString("main_category_name", defaultValue: "")
    }
}
