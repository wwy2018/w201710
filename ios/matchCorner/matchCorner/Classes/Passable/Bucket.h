//
//  Bucket.h
//  matchCorner
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kBucketKeyTypeTag @"kBucketDataKeyTypeTag"
#define kBucketKeyTypeData @"kBucketDataKeyTypeData"

@interface Bucket : NSObject

-(instancetype)init;
-(void)bucketInWithKey:(NSString *)key value:(NSObject *)value;
-(NSObject *)bucketOutWithKey:(NSString *)key;
-(NSObject *)valueForKey:(NSString *)key;

@end
