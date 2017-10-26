//
//  EditViewController.m
//  tableTest
//
//  Created by wwy on 2017/10/26.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "EditViewController.h"
#import "myModel.h"
@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)saveBtn:(id)sender;
- (IBAction)editAction:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBtn;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameField.text=self.contactModel.name;
    self.phoneField.text=self.contactModel.phone;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phoneField];
}
-(void)textChange{
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

- (IBAction)saveBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    if ([self.delegate respondsToSelector:@selector(editViewController:didSaveContact:)]) {
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
        sender.title=@"edit";
        self.nameField.text=self.contactModel.name;
        self.phoneField.text=self.contactModel.phone;
    }else{
        self.nameField.enabled=YES;
        self.phoneField.enabled=YES;
        [self.view endEditing:YES];
        self.saveBtn.hidden=NO;
        sender.title=@"cancel";
    }
}

@end
