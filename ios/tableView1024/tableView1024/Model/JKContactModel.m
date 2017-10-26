//
//  JKContactModel.m
//  tableView1024
//
//  Created by wwy on 2017/10/24.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "JKContactModel.h"

@implementation JKContactModel
// 写入时调用
-(void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.phone forKey:@"phone"];
}
// 解析时调用
-(id)initWithCoder:(NSCoder *)decoder{
    if (self == [super init]) {
        self.name=[decoder decodeObjectForKey:@"name"];
        self.phone=[decoder decodeObjectForKey:@"phone"];
    }
    return self;
}
@end
