//
//  ViewController.m
//  weather
//
//  Created by wwy on 2017/10/24.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path=@"http://aqicn.org/publishingdata/json";
    NSURL *url=[NSURL URLWithString:path];
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    NSDictionary *s=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSString *city=[s valueForKey:@"cityName"];
    NSLog(@"%@", s);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
