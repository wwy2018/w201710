//
//  EditViewController.h
//  tableView1024
//
//  Created by wwy on 2017/10/24.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JKContactModel, EditViewController;
@protocol EditViewContollerDelegate<NSObject>
@optional
-(void)editViewController:(EditViewController *)editVc didSaveContact:(JKContactModel *)model;
@end
@interface EditViewController : UIViewController
// 声明代理属性
@property(nonatomic, assign)id<EditViewContollerDelegate> delegate;
@property (nonatomic, strong) JKContactModel *contactModel;
@end
