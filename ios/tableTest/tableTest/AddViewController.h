//
//  AddViewController.h
//  tableTest
//
//  Created by wwy on 2017/10/26.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddViewController,myModel;
@protocol AddViewControllerDelegate<NSObject>
@optional
-(void)addContact:(AddViewController*)addVc didAddContact:(myModel*)contact;
@end
@interface AddViewController : UIViewController
//代理属性 assign类型 防止循环引用
@property(nonatomic,assign)id<AddViewControllerDelegate>delegate;
@end
