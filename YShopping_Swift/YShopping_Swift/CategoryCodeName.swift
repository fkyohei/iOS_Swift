//
//  CategoryCodeName.swift
//  YShopping_Swift
//
//  Created by kyohei on 2015/07/05.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class CategoryCodeName: RLMObject {
    dynamic var id = 0
    dynamic var code = ""
    dynamic var name = ""
}