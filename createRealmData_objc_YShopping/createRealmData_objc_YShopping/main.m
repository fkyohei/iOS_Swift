//
//  main.m
//  createRealmData_objc_YShopping
//
//  Created by 藤崎 恭平 on 2015/07/03.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "CategoryCodeName.h"
#import "Sort.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteAllObjects];
        
        NSArray *aryDef = [NSArray arrayWithObjects:@"CategoryCodeName", @"Sort", nil];
        
        for(int i = 0; i < aryDef.count; i++) {
            NSString *className = aryDef[i];
            
            // Import JSON
            NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:className ofType:@"json"];
            NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath];
            NSError *error = nil;
            
            NSArray *aryDicts = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                options:0
                                                                  error:&error];
            
            if (error) {
                NSLog(@"There was an error reading the JSON file: %@", error.localizedDescription);
                return 1;
            }
            
            int j = 1;
            for (NSDictionary *aryDict in aryDicts) {
                if (className == @"CategoryCodeName") {
                    CategoryCodeName *instance = [[CategoryCodeName alloc] init];
                    instance.id = j;
                    instance.code = aryDict[@"code"];
                    instance.name = aryDict[@"name"];
                    
                    j++;
                    [realm addObject:instance];
                }
                else if (className == @"Sort") {
                    Sort *instance = [[Sort alloc] init];
                    instance.id = j;
                    instance.code = aryDict[@"code"];
                    instance.name = aryDict[@"name"];
                    
                    j++;
                    [realm addObject:instance];
                }
            }
        }
        
        [realm commitWriteTransaction];
        
        NSError *error2 = nil;
        BOOL result = [realm writeCopyToPath:@"/Users/kyohei/Desktop/YShopping_v1.realm" error:&error2];
    }
    return 0;
}