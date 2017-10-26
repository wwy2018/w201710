//
//  AddViewController.m
//  tableView1024
//
//  Created by wwy on 2017/10/24.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "AddViewController.h"
#import "JKContactModel.h"
@interface AddViewController ()
- (IBAction)backAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
- (IBAction)AddAction;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phoneField];
}

-(void)textChange{
    //    if(self.nameField.text.length && self.pwdField.text.length){
    //        self.loginBtn.enabled=true;
    //    }else{
    //        self.loginBtn.enabled=false;
    //    }
    // 输入用户名密码按钮可点击
    self.addBtn.enabled=(self.nameField.text.length && self.phoneField.text.length);
}
// 进入页面时 键盘自动弹出
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.nameField becomeFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backAction:(id)sender {
}
// 添加数据
- (IBAction)AddAction {
    // 关闭当前视图控制器
    [self.navigationController popViewControllerAnimated:YES];
    // 代理传值
    if ([self.delegate respondsToSelector:@selector(addContact:didAddContact:)]){
        JKContactModel *contactModel=[[JKContactModel alloc]init];
        contactModel.name=self.nameField.text;
        contactModel.phone=self.phoneField.text;
        [self.delegate addContact:self didAddContact:contactModel];
    }
}

@end
