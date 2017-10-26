//
//  DetailViewController.h
//  Note
//
//  Created by wwy on 2017/10/26.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "NoteDao.h"

@interface DetailViewController : UIViewController

@property(strong,nonatomic)id detailItem;
@property(weak,nonatomic)IBOutlet UILabel *detailDescriptionLabel;

@end
