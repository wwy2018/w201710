//
//  NavigationHelper.m
//  matchCorner
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "NavigationHelper.h"
#import "Passable.h"
// 单例 目的：保持局部可见
static NavigationHelper *_instance=nil;
@implementation NavigationHelper

+(instancetype)defaultHelper{
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        _instance=[[super allocWithZone:NULL]init];
        [_instance initialization];
    });
    return _instance;
    
}
-(void)initialization{
    self.bucket=[[Bucket alloc]init];
}
+(id)allocWithZone:(struct _NSZone *)zone{
    return [NavigationHelper defaultHelper];
}
-(id)copyWithZone:(struct _NSZone *)zone{
    return [NavigationHelper defaultHelper];
}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([viewController conformsToProtocol:@protocol(Passable)]) {
        id<Passable> object=(id<Passable>)viewController;
        if ([object respondsToSelector:@selector(viewControllerDidShowWithTag:data:)]) {
            NSString *key=[NSString stringWithFormat:@"%@", viewController];
            NSDictionary *entries=(NSDictionary *)[_bucket bucketOutWithKey:key];
            if (entries != nil) {
                NSString *tag=entries[kBucketKeyTypeTag];
                NSObject *data=entries[kBucketKeyTypeData];
                [object viewControllerDidShowWithTag:tag data:data];
            }
        }
    }
}
@end
