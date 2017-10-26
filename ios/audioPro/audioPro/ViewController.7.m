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
    CGRect screen=[[UIScreen mainScreen]bounds];
    CGFloat pickerViewWidth=320;
    CGFloat pickerViewHeight=162;
    self.pickerView=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, pickerViewWidth, pickerViewHeight)];
    
    self.pickerView.dataSource=self;
    self.pickerView.delegate=self;
    
    NSString *plistPath=[[NSBundle mainBundle]pathForResource:@"city" ofType:@"plist"];
    NSDictionary *dict=[[NSDictionary alloc]initWithContentsOfFile:plistPath];
    self.pickerData=dict;
    self.pickerProvincesData=[self.pickerData allKeys];
    NSString *selectedProvince=[self.pickerProvincesData objectAtIndex:0];
    self.pickerCitiesData=[self.pickerData objectForKey:selectedProvince];
    
    
    [self.view addSubview:self.pickerView];
    
    CGFloat labelWidth=200;
    CGFloat labelHeight=21;
    CGFloat labelTopView=273;
    self.label=[[UILabel alloc]initWithFrame:CGRectMake((screen.size.width-labelWidth)/2, labelTopView, labelWidth, labelHeight)];
    self.label.text=@"label";
    self.label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    CGFloat buttonWidth=46;
    CGFloat buttonHeight=30;
    CGFloat buttonTopView=374;
    button.frame=CGRectMake((screen.size.width-buttonWidth)/2, buttonTopView, buttonWidth, buttonHeight);
    [button addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)onclick:(id)sender{
    NSInteger row1=[self.pickerView selectedRowInComponent:0];
    NSInteger row2=[self.pickerView selectedRowInComponent:1];
    NSString *selected1=[self.pickerProvincesData objectAtIndex:row1];
    NSString *selected2=[self.pickerCitiesData objectAtIndex:row2];
    NSString *title=[[NSString alloc]initWithFormat:@":%@, %@city", selected1, selected2];
    self.label.text = title;
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return [self.pickerProvincesData count];
    } else {
        return [self.pickerCitiesData count];
    }
}
// pickerviewdeleget functions
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return [self.pickerProvincesData objectAtIndex:row];
    } else {
        return [self.pickerCitiesData objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        NSString *selectedProvince=[self.pickerProvincesData objectAtIndex:row];
        NSArray *array=[self.pickerData objectForKey:selectedProvince];
        self.pickerCitiesData=array;
        [self.pickerView reloadComponent:1];
    }
}

@end
