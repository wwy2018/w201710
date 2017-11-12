//
//  RegisterViewController.m
//  ModalViewSample
//
//  Created by wwy on 27/10/2017.
//  Copyright © 2017 wwy. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"click save");
        NSDictionary *dataDict=@{@"username":self.userNameField.text};
        [[NSNotificationCenter defaultCenter]postNotificationName:@"RegisterCompletionNotification" object:nil userInfo:dataDict];
    }];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"click save");
    }];
}
@end
