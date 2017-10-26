//
//  EditViewController.m
//  tableView1024
//
//  Created by wwy on 2017/10/24.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "EditViewController.h"
#import "JKContactModel.h"
@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)saveAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *edit;
- (IBAction)editAction:(UIBarButtonItem *)sender;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameField.text=self.contactModel.name;
    self.phoneField.text=self.contactModel.phone;
    
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
    self.saveBtn.enabled=(self.nameField.text.length && self.phoneField.text.length);
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
// 保存 传递数据
- (IBAction)saveAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(editViewController:didSaveContact:)]){
        self.contactModel.name=self.nameField.text;
        self.contactModel.phone=self.phoneField.text;
        [self.delegate editViewController:self didSaveContact:self.contactModel];
    }
}


- (IBAction)editAction:(UIBarButtonItem *)sender {
    if (self.nameField.enabled) {
        self.nameField.enabled=NO;
        self.phoneField.enabled=NO;
        [self.view endEditing:YES];
        self.saveBtn.hidden=YES;
        sender.title=@"编辑";
        // 还原数据
        self.nameField.text=self.contactModel.name;
        self.phoneField.text=self.contactModel.phone;
    }else{
        self.nameField.enabled=YES;
        self.phoneField.enabled=YES;
        [self.view endEditing:YES];
        self.saveBtn.hidden=NO;
        sender.title=@"取消";
    }
}
@end
