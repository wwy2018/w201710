//
//  ViewController.m
//  StudyDrive
//
//  Created by wwy on 2017/10/24.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "ViewController.h"
#import "selectView.h"

@interface ViewController (){
    selectView *_selecView;
    __weak IBOutlet UIButton *selecBtn;
}

@end

@implementation ViewController
- (IBAction)clickBtn:(UIButton *)sender {
    switch (sender.tag) {
        case 101:
            {
                NSLog(@"click---");
                [UIView animateWithDuration:0.3 animations:^{
                    _selecView.alpha=1;
                }];
            }
            break;
            
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _selecView=[[selectView alloc]initWithFrame:self.view.frame andBtn:selecBtn];
    _selecView.alpha=0;
    [self.view addSubview:_selecView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
