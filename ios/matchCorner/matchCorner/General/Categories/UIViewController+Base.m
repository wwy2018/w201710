//
//  UIViewController+Base.m
//  matchCorner
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "UIViewController+Base.h"


@implementation UIViewController (Base)
-(SlideMenuViewController *)slideMemuController{
    UIViewController *controller=self.parentViewController;
    while (controller != nil) {
        if (controller.class == SlideMenuViewController.class) {
            return (SlideMenuViewController *)controller;
        }else{
            controller=controller.parentViewController;
        }
    }
    return nil;
}
-(IBAction)backButtonPressed:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
