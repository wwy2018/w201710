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
@property (strong, nonatomic) UIDatePicker *datePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect screen=[[UIScreen mainScreen]bounds];
    CGFloat datePickerWidth=320;
    CGFloat datePickerHeight=167;
    self.datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, datePickerWidth, datePickerHeight)];
    self.datePicker.locale=[NSLocale localeWithLocaleIdentifier:@"zh-hans"];
    self.datePicker.datePickerMode=UIDatePickerModeDateAndTime;
    [self.datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.datePicker];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dateChange:(UIDatePicker *)sender{
    NSDate *select=[sender date];
    NSDateFormatter *selectDateFormatter=[[NSDateFormatter alloc]init];
    selectDateFormatter.dateFormat=@"yy:MM:dd HH:mm:ss";
    NSString *dateAndTime=[selectDateFormatter stringFromDate:select];
    NSLog(@"%@",dateAndTime);
}

@end
