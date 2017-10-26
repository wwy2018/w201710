//
//  myModel.m
//  tableTest
//
//  Created by wwy on 2017/10/26.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "myModel.h"

@implementation myModel
// 实现nscoding方法 进行对象归档 写入对象时调用 这个方法说清楚哪些属性需要存储
-(void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.phone forKey:@"phone"];
}
// 解析对象时调用 需要解析哪些属性
-(id)initWithCoder:(NSCoder*)decoder{
    if (self == [super init]) {
        self.name=[decoder decodeObjectForKey:@"name"];
        self.phone=[decoder decodeObjectForKey:@"phone"];
    }
    return self;
}
@end
