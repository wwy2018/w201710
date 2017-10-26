//
//  UINavigationController+Passable.h
//  matchCorner
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Passable)

-(void)pushViewControllerWithStoryboardID:(NSString *)identifier animated:(BOOL)animated tag:(NSString *)tag data:(NSObject *)data;
-(UIViewController *)popViewControllerAnimated:(BOOL)animated tag:(NSString *)tag data:(NSObject *)data;
-(NSArray *)popToRootViewControllerAnimated:(BOOL)animated tag:(NSString *)tag data:(NSObject *)data;
-(void)pushViewControllerWithStoryboardID:(NSString *)identifier animated:(BOOL)animated data:(NSObject *)data;
-(UIViewController *)popViewControllerAnimated:(BOOL)animated data:(NSObject *)data;
-(NSArray *)popToRootViewControllerAnimated:(BOOL)animated data:(NSObject *)data;

@end
