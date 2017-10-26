//
//  EventCollectionViewCell.m
//  audioPro
//
//  Created by wwy on 2017/10/23.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "EventCollectionViewCell.h"

@implementation EventCollectionViewCell
-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        CGFloat cellWidth=self.frame.size.width;
        CGFloat imageViewWidth=101;
        CGFloat imageViewHeight=101;
        CGFloat imageViewTopView=15;
        self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake((cellWidth-imageViewWidth)/2, imageViewTopView, imageViewWidth, imageViewHeight)];
        [self addSubview:self.imageView];
        
        CGFloat labelWidth=101;
        CGFloat labelHeight=16;
        CGFloat labelTopView=120;
        self.label=[[UILabel alloc]initWithFrame:CGRectMake((cellWidth-labelWidth)/2, labelTopView, labelWidth, labelHeight)];
        self.label.textAlignment=NSTextAlignmentCenter;
        self.label.font=[UIFont systemFontOfSize:13];
        [self addSubview:self.label];
    }
    return self;
}
@end
