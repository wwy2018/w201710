//
//  AddViewController.m
//  tableTest
//
//  Created by wwy on 2017/10/26.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "AddViewController.h"
#import "myModel.h"
@interface AddViewController ()
- (IBAction)backAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
- (IBAction)addAction;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phoneField];
}
-(void)textChange{
    self.addBtn.enabled=(self.nameField.text.length && self.phoneField.text.length);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.nameField becomeFirstResponder];
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
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)addAction {
    [self.navigationController popViewControllerAnimated:YES];
    if ([self.delegate respondsToSelector:@selector(addContact:didAddContact:)]) {
        myModel *contactModel=[[myModel alloc]init];
        contactModel.name=self.nameField.text;
        contactModel.phone=self.phoneField.text;
        [self.delegate addContact:self didAddContact:contactModel];
    }
}
@end
