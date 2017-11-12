//
//  ViewController.m
//  ModalViewSample
//
//  Created by wwy on 27/10/2017.
//  Copyright © 2017 wwy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(registerCompletion:) name:@"RegisterCompletionNotification" object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
-(void)registerCompletion:(NSNotification*)notification{
    NSDictionary *theData=[notification userInfo];
    NSString *username=theData[@"username"];
    self.nameField.text=username;
    NSLog(@"username=%@",username);
}

@end
