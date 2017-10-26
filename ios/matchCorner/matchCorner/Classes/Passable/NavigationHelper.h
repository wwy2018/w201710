//
//  NavigationHelper.h
//  matchCorner
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bucket.h"
@interface NavigationHelper : NSObject<UINavigationControllerDelegate>

@property(nonatomic, strong)Bucket *bucket;
+(instancetype)defaultHelper;

@end
