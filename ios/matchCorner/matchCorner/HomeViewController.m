//
//  HomeViewController.m
//  matchCorner
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "HomeViewController.h"
#import "UIViewController+Base.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NavigationHelper *helper=[NavigationHelper defaultHelper];
    self.navigationController.delegate=helper;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.slideMemuController.pan.enabled=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.slideMemuController.pan.enabled=NO;
}
- (IBAction)buttonPressed:(id)sender {
    [self.slideMemuController switchController];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
