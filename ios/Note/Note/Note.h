//
//  Note.h
//  Note
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject
@property(nonatomic, strong)NSDate *date;
@property(nonatomic, strong)NSString *content;
-(instancetype)initWithDate:(NSDate*)date content:(NSString*)content;
-(instancetype)init;
@end
