//
//  ContactTableViewController.m
//  tableTest
//
//  Created by wwy on 2017/10/26.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "ContactTableViewController.h"
#import "myModel.h"
#import "AddViewController.h"
#import "EditViewController.h"

// 存储路径
#define ContactFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"contact.data"]

@interface ContactTableViewController ()<AddViewControllerDelegate,EditViewControllerDelegate>
- (IBAction)backAction:(id)sender;
@property(nonatomic,strong)NSMutableArray *contactArr;
@end

@implementation ContactTableViewController
-(NSMutableArray*)contactArr{
    if (!_contactArr) {
        //解码拿到数组
        _contactArr=[NSKeyedUnarchiver unarchiveObjectWithFile:ContactFilePath];
        if (_contactArr == nil) {
            _contactArr=[NSMutableArray array];
        }
        
    }
    return _contactArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    return [self.contactArr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    myModel *contactModel=self.contactArr[indexPath.row];
    cell.textLabel.text=contactModel.name;
    cell.detailTextLabel.text=contactModel.phone;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.contactArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        // 归档
        [NSKeyedArchiver archiveRootObject:self.contactArr toFile:ContactFilePath];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
    id vc=segue.destinationViewController;
    if ([vc isKindOfClass:[AddViewController class]]) {
        AddViewController *addVc=vc;
        addVc.delegate=self;
    }else if([vc isKindOfClass:[EditViewController class]]){
        EditViewController *editVc=vc;
        NSIndexPath *path=[self.tableView indexPathForSelectedRow];
        editVc.contactModel=self.contactArr[path.row];
        editVc.delegate=self;
    }
}


- (IBAction)backAction:(id)sender {
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"loginout?" message:NULL preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        [self.navigationController popViewControllerAnimated:NO];
    }]];
    [self presentViewController:alert animated:YES completion:NULL];
}
-(void)addContact:(AddViewController *)addVc didAddContact:(myModel *)contact{
    [self.contactArr addObject:contact];
    [self.tableView reloadData];
    // 归档
    [NSKeyedArchiver archiveRootObject:self.contactArr toFile:ContactFilePath];
}
-(void)editViewController:(EditViewController*)editVc didSaveContact:(myModel*)model{
    [self.tableView reloadData];
    //归档
    [NSKeyedArchiver archiveRootObject:self.contactArr toFile:ContactFilePath];
}
@end
