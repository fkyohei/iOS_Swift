//
//  DetailViewController.h
//  test
//
//  Created by 藤崎 恭平 on 2015/06/16.
//  Copyright (c) 2015年 藤崎 恭平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

