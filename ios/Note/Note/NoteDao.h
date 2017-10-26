//
//  NoteDao.h
//  Note
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"
@interface NoteDao : NSObject
+(NoteDao*)sharedInstance;
-(int)create:(Note*)model;
-(int)remove:(Note*)model;
-(int)modify:(Note*)model;
-(NSMutableArray*)findAll;
-(Note*)findById:(Note*)model;
@end
