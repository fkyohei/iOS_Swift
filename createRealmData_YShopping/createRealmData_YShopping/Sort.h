//
//  Sort.h
//  createRealmData_YShopping
//
//  Created by 藤崎 恭平 on 2015/07/03.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

#import <Realm/Realm.h>

@interface Sort : RLMObject
@property NSString *code;
@property NSString *name;
@property NSInteger  id;
@end
RLM_ARRAY_TYPE(Sort)