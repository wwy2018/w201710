//
//  ViewController.m
//  audioPro
//
//  Created by wwy on 2017/10/21.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () 


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIStackView *stack=[[UIStackView alloc]initWithFrame:CGRectMake(50, 50, 200, 50)];
    stack.axis=UILayoutConstraintAxisHorizontal;
    [self.view addSubview:stack];
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    image.image=[UIImage imageNamed:@"zan.png"];
    [stack addArrangedSubview:image];
    UIStackView *sub=[[UIStackView alloc]initWithFrame:CGRectMake(0, 0, 150, 50)];
    sub.axis=UILayoutConstraintAxisVertical;
    sub.alignment=UIStackViewAlignmentLeading;
    sub.backgroundColor=[UIColor redColor];
    [stack addArrangedSubview:sub];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
