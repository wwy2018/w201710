//
//  UIViewController+Base.h
//  matchCorner
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideMenuViewController.h"
#import "Passable.h"
#import "NavigationHelper.h"
#import "UINavigationController+Passable.h"

@interface UIViewController (Base)
@property (nonatomic, readonly) SlideMenuViewController *slideMemuController;
@end
