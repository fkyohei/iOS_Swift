//
//  BaseModel.swift
//  ShokuTan
//
//  Created by kyohei on 2015/11/01.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    var appdelegate: AppDelegate!

    override init() {
        super.init()
        self.appdelegate = AppDelegate.sharedAppDelegate()
    }
}
