//
//  ContactTableViewController.m
//  tableView1024
//
//  Created by wwy on 2017/10/24.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "ContactTableViewController.h"
#import "JKContactModel.h"
#import "AddViewController.h"
#import "EditViewController.h"

// 定义路径
#define ContactFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) lastObject]stringByAppendingPathComponent:@"contacts.data"]

@interface ContactTableViewController ()<AddViewControllerDelegate,EditViewContollerDelegate>
- (IBAction)backAction:(id)sender;
@property (nonatomic, strong) NSMutableArray *contactArr;
@end

@implementation ContactTableViewController
-(NSMutableArray *)contactArr{
    if(!_contactArr){
        _contactArr=[NSKeyedUnarchiver unarchiveObjectWithFile:ContactFilePath];
        if (_contactArr == nil) {
            _contactArr=[NSMutableArray array];
        }
    }
    return _contactArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self clearExtraLine:self.tableView];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.contactArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    
    // Configure the cell...
    JKContactModel *contactModel=self.contactArr[indexPath.row];
    cell.textLabel.text=contactModel.name;
    cell.detailTextLabel.text=contactModel.phone;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - addviewcontroller delegate
-(void)addContact:(AddViewController *)addVc didAddContact:(JKContactModel *)contact{
    // 添加数据模型
    [self.contactArr addObject:contact];
    // 刷新表视图
    [self.tableView reloadData];
    // 归档
    [NSKeyedArchiver archiveRootObject:self.contactArr toFile:ContactFilePath];
    
}

#pragma mark-去掉多余的单元格
-(void)clearExtraLine:(UITableView *)tableView{
    // 创建一个view 覆盖掉单元格
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor clearColor];
    [self.tableView setTableFooterView:view];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//    AddViewController *addVc=segue.destinationViewController;
//    addVc.delegate=self;
    // 判断目的控制器
    id vc=segue.destinationViewController;
    if([vc isKindOfClass:[AddViewController class]]){
        AddViewController *addVc=vc;
        addVc.delegate=self;
    }else if([vc isKindOfClass:[EditViewController class]]){
        EditViewController *editVc=vc;
        // 取得选中行
        NSIndexPath *path=[self.tableView indexPathForSelectedRow];
        editVc.contactModel=self.contactArr[path.row];
        editVc.delegate=self;
    }
}

#pragma mark-滑动删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contactArr removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        // 归档
        [NSKeyedArchiver archiveRootObject:self.contactArr toFile:ContactFilePath];
    }
}

- (IBAction)backAction:(id)sender {
    // 初始化alert controller
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"是否注销？" message:@"点击下方" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler: ^(UIAlertAction *action){
        [self.navigationController popViewControllerAnimated:NO];
    }]];
    // 弹出
    [self presentViewController:alert animated:YES completion:NULL];
}
@end
