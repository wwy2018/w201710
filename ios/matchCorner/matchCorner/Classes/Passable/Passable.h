//
//  Passable.h
//  matchCorner
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Passable <NSObject>
@optional
-(void)viewControllerDidShowWithTag:(NSString *)tag data:(NSObject *)data;
@end
