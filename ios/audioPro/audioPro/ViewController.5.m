//
//  ViewController.m
//  audioPro
//
//  Created by wwy on 2017/10/21.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () 
@property (strong, nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect screen=[[UIScreen mainScreen]bounds];
    CGFloat labelWidth=90;
    CGFloat labelHeight=20;
    CGFloat labelTopView=150;
    CGRect labelFrame=CGRectMake((screen.size.width - labelWidth)/2, labelTopView, labelWidth, labelHeight);
    self.label=[[UILabel alloc]initWithFrame:labelFrame];
    self.label.text=@"my label";
    self.label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"ok" forState:UIControlStateNormal];
    CGFloat buttonWidth=60;
    CGFloat buttonHeight=20;
    CGFloat buttonTopView=240;
    button.frame=CGRectMake((screen.size.width-buttonWidth)/2, buttonTopView, buttonWidth, buttonHeight);
    // button add event
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onClick:(id)sender{
    NSLog(@"click");
    self.label.text=@"change";
}

@end
