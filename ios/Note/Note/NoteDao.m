//
//  NoteDao.m
//  Note
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "NoteDao.h"
@interface NoteDao()

@property(nonatomic, strong)NSDateFormatter *dateFormatter;
@property(nonatomic, strong)NSString *plistFilePath;

@end

@implementation NoteDao

static NoteDao *sharedSingleton=nil;
+(NoteDao*)sharedInstance{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedSingleton=[[self alloc]init];
        sharedSingleton.plistFilePath=[sharedSingleton applicationDocumentsDirectoryFile];
        sharedSingleton.dateFormatter=[[NSDateFormatter alloc]init];
        [sharedSingleton.dateFormatter setDateFormat:@"yyyy-MM-dd"];
        [sharedSingleton createEditableCopyOfDatabaseIfNeeded];
    });
    return sharedSingleton;
}
-(void)createEditableCopyOfDatabaseIfNeeded{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    BOOL dbexits=[fileManager fileExistsAtPath:self.plistFilePath];
    if (!dbexits) {
        NSBundle *frameworkBundle=[NSBundle bundleForClass:[NoteDao class]];
        NSString *frameworkBundlePath=[frameworkBundle resourcePath];
        NSString *defaultDBPath=[frameworkBundlePath stringByAppendingPathComponent:@"NotesList.plist"];
        NSError *error;
        BOOL success=[fileManager copyItemAtPath:defaultDBPath toPath:self.plistFilePath error:&error];
        if (error) {
            NSAssert(success, @"错误写入文件");
        }
        
    }
}
-(NSString *)applicationDocumentsDirectoryFile{
    NSString *documentDirectory=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE) lastObject];
    NSString *path=[documentDirectory stringByAppendingPathComponent:@"NotesList.plist"];
    return path;
}
-(int)create:(Note *)model{
    NSMutableArray *array=[[NSMutableArray alloc]initWithContentsOfFile:self.plistFilePath];
    NSString *strDate=[self.dateFormatter stringFromDate:model.date];
    NSDictionary *dict=@{@"date":strDate, @"content":model.content};
    [array addObject:dict];
    [array writeToFile:self.plistFilePath atomically:TRUE];
    return 0;
}

-(int)remove:(Note *)model{
    NSMutableArray *array=[[NSMutableArray alloc]initWithContentsOfFile:self.plistFilePath];
    for (NSDictionary *dict in array) {
        NSString *strDate=dict[@"date"];
        NSDate *date=[self.dateFormatter dateFromString:strDate];
        if ([date isEqualToDate:model.date]) {
            [array removeObject:dict];
            [array writeToFile:self.plistFilePath atomically:TRUE];
            break;
        }
    }
    return 0;
}
-(int)modify:(Note *)model{
    NSArray *array=[[NSArray alloc]initWithContentsOfFile:self.plistFilePath];
    for (NSDictionary *dict in array) {
        NSDate *date=[self.dateFormatter dateFromString:dict[@"date"]];
        if ([date isEqualToDate:model.date]) {
            [dict setValue:model.content forKey:@"content"];
            [array writeToFile:self.plistFilePath atomically:TRUE];
            break;
        }
    }
    return 0;
}
-(NSMutableArray*)findAll{
    NSArray *arry=[[NSArray alloc]initWithContentsOfFile:self.plistFilePath];
    NSMutableArray *listData=[[NSMutableArray alloc]init];
    for (NSDictionary *dict in arry) {
        NSString *strDate=dict[@"date"];
        NSDate *date=[self.dateFormatter dateFromString:strDate];
        NSString *content=dict[@"content"];
        Note *note=[[Note alloc]initWithDate:date content:content];
        [listData addObject:note];
    }
    return listData;
}
-(Note*)findById:(Note *)model{
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:self.plistFilePath];
    for (NSDictionary *dict in array) {
        
        NSString *strDate = dict[@"date"];
        NSDate *date = [self.dateFormatter dateFromString:strDate];
        NSString *content = dict[@"content"];
        
        //比较日期主键是否相等
        if ([date isEqualToDate:model.date]) {
            Note *note = [[Note alloc] initWithDate:date content:content];
            return note;
        }
    }
    return nil;
}
@end
