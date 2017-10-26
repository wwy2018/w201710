//
//  Bucket.m
//  matchCorner
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "Bucket.h"
@interface Bucket ()
// 私有方法
@property(nonatomic, strong)NSMutableDictionary *data;
@end
@implementation Bucket

-(instancetype)init{
    if (self = [super init]) {
        self.data=[[NSMutableDictionary alloc]init];
    }
    return self;
}
-(void)bucketInWithKey:(NSString *)key value:(NSObject *)value{
    _data[key]=value;
}
-(NSObject *)bucketOutWithKey:(NSString *)key{
    NSObject *value=_data[key];
    [_data removeObjectForKey:key];
    return value;
}
-(NSObject *)valueForKey:(NSString *)key{
    return _data[key];
}


@end
