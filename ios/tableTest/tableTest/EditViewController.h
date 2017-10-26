//
//  EditViewController.h
//  tableTest
//
//  Created by wwy on 2017/10/26.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import <UIKit/UIKit.h>
// 使用class防止相互导入
@class myModel,EditViewController;
@protocol EditViewControllerDelegate <NSObject>
@optional
-(void)editViewController:(EditViewController*)editVc didSaveContact:(myModel*)model;
@end
@interface EditViewController : UIViewController
@property(nonatomic,strong)myModel *contactModel;
@property(nonatomic,assign)id<EditViewControllerDelegate>delegate;
@end
