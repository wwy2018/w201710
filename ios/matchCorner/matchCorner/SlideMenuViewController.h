//
//  SlideMenuViewController.h
//  matchCorner
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideMenuViewController : UIViewController

@property(nonatomic,weak)IBOutlet UIPanGestureRecognizer *pan;
-(void)switchController;

@end
