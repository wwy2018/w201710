//
//  AddViewController.m
//  Note
//
//  Created by wwy on 2017/10/26.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()<UITextViewDelegate>
@property(weak,nonatomic)IBOutlet UITextView *txtView;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.txtView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)onclickCancel:(id)sender{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}
-(IBAction)onclickSave:(id)sender{
    Note *note=[[Note alloc]init];
    note.date=[[NSDate alloc]init];
    note.content=self.txtView.text;
    NoteDao *dao=[NoteDao sharedInstance];
    [dao create:note];
    NSMutableArray *reslist=[dao findAll];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadViewNotification" object:reslist userInfo:nil];
    [self.txtView resignFirstResponder];
    [self dismissViewControllerAnimated:TRUE completion:nil];
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return FALSE;
    }
    return TRUE;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
