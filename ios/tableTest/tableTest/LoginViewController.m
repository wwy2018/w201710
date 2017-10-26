//
//  LoginViewController.m
//  tableTest
//
//  Created by wwy on 2017/10/26.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "LoginViewController.h"

// 数据存储宏定义
#define UserNamekey @"name"
#define PwdKey @"pwd"
#define RmbPwdKey @"rmb_pwd"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UISwitch *rembSwitch;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)loginAction:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
    // 读取配置
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    self.nameField.text=[defaults valueForKey:UserNamekey];
    self.pwdField.text=[defaults valueForKey:PwdKey];
    self.rembSwitch.on=[defaults boolForKey:RmbPwdKey];
    if (self.rembSwitch.isOn) {
        self.pwdField.text=[defaults valueForKey:PwdKey];
        self.loginBtn.enabled=true;
    }
}
-(void)textChange{
    self.loginBtn.enabled=(self.nameField.text.length && self.pwdField.text.length);
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *contactVc=segue.destinationViewController;
    contactVc.title=[NSString stringWithFormat:@"%@",self.nameField.text];
}


- (IBAction)loginAction:(id)sender {
    [self performSegueWithIdentifier:@"LoginToContact" sender:nil];
    // 登陆存储信息
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:self.nameField.text forKey:UserNamekey];
    [defaults setObject:self.pwdField.text forKey:PwdKey];
    [defaults setBool:self.rembSwitch.isOn forKey:RmbPwdKey];
    [defaults synchronize];
}

@end
