//
//  LoginViewController.m
//  tableView1024
//
//  Created by wwy on 2017/10/24.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD.h"
// 设置存储字典关键字
#define UserNameKey @"name"
#define PwdKey @"pwd"
#define RmbPwdKey @"rmb_pwd"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UISwitch *rembSwitch;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)loginAction;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 添加观察者
    // 有一点要注意 selector调用没有参数的function时 function名称后面不能跟冒号
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
    // 进入程序 读取之前数据
    // 这是一个单例 所以初始化方法要这样写
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    self.nameField.text=[defaults valueForKey:UserNameKey];
//    self.pwdField.text=[defaults valueForKey:PwdKey];
//    self.rembSwitch.on=[defaults valueForKey:RmbPwdKey];
//    if (self.rembSwitch.on) {
//        self.pwdField.text=[defaults valueForKey:PwdKey];
//    }
}

-(void)textChange{
//    if(self.nameField.text.length && self.pwdField.text.length){
//        self.loginBtn.enabled=true;
//    }else{
//        self.loginBtn.enabled=false;
//    }
    // 输入用户名密码按钮可点击
    self.loginBtn.enabled=(self.nameField.text.length && self.pwdField.text.length);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
// 跳转之前执行
// 这个方法给下个方法传值 sender
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    // 取得目标控制器
    UIViewController *contactVc=segue.destinationViewController;
    contactVc.title=[NSString stringWithFormat:@"%@的联系人列表", self.nameField.text];
}

// 点击跳转 执行跳转的线
- (IBAction)loginAction {
    if(![self.nameField.text isEqualToString:@"jike"]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeAnnularDeterminate;
        hud.labelText = @"账号不存在";
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            // Do something...
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [hud hide:YES];
        });
        return;
    }
    if(![self.pwdField.text isEqualToString:@"qq"]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeAnnularDeterminate;
        hud.labelText = @"密码不正确";
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            // Do something...
            [hud hide:YES];
        });
        return;
    }
    [self performSegueWithIdentifier:@"LoginToContact" sender:nil];
    // 存储数据
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:self.nameField.text forKey:UserNameKey];
//    [defaults setObject:self.pwdField.text forKey:PwdKey];
//    [defaults setObject:self.rembSwitch forKey:RmbPwdKey];
//    // 设置同步
//    [defaults synchronize];
}
@end
