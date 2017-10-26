//
//  selectView.m
//  StudyDrive
//
//  Created by wwy on 2017/10/24.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "selectView.h"

@implementation selectView
{
    UIButton *_button;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame andBtn:(UIButton *)btn{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        _button=btn;
        [self createBtn];
    }
    return self;
}
-(void)createBtn{
    for (int i=0; i<4; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame=CGRectMake(self.frame.size.width/4*i+self.frame.size.width/4/2-30, self.frame.size.height-80, 60, 60);
        NSString *t=[NSString stringWithFormat:@"btn %d", i];
        [btn setTitle:t forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor blueColor]];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha=0;
    }];
}
-(void)click:(UIButton *)btn{
    [_button setTitle:[btn titleForState:UIControlStateNormal] forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha=0;
    }];
}
@end
