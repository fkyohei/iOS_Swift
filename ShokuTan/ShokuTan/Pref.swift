//
//  Pref.swift
//  ShokuTan
//
//  Created by kyohei on 2015/10/17.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import Foundation
import RealmSwift

class Pref: Object {
    dynamic var id       = 0
    dynamic var code     = ""
    dynamic var name     = ""
    dynamic var areacode = ""
}