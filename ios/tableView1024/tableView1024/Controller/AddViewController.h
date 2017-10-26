//
//  AddViewController.h
//  tableView1024
//
//  Created by wwy on 2017/10/24.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import <UIKit/UIKit.h>
// 导入模型和视图控制器
@class AddViewController, JKContactModel;
@protocol AddViewControllerDelegate<NSObject>
@optional
-(void)addContact:(AddViewController *)addVc didAddContact:(JKContactModel *)contact;
@end
@interface AddViewController : UIViewController

@property(nonatomic,assign)id<AddViewControllerDelegate>delegate;

@end
