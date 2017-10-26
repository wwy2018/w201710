//
//  MasterTableViewController.m
//  Note
//
//  Created by wwy on 2017/10/26.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "MasterTableViewController.h"
#import "DetailViewController.h"

@interface MasterTableViewController ()
@property(nonatomic,strong)NSMutableArray* listData;
@end

@implementation MasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem=self.editButtonItem;
    self.detailViewController=(DetailViewController*)[[self.splitViewController.viewControllers lastObject] topViewController];
    NoteDao *dao=[NoteDao sharedInstance];
    self.listData=[dao findAll];
    // 这里一个问题 是因为reloadview后面少加了冒号
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadView:) name:@"reloadViewNotification" object:nil];
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.clearsSelectionOnViewWillAppear=self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
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
    return self.listData.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier]isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        Note *note=self.listData[indexPath.row];
        DetailViewController *controller=(DetailViewController*)[[segue destinationViewController]topViewController];
        [controller setDetailItem:note];
        controller.navigationItem.leftBarButtonItem=self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton=YES;
        NSLog(@"prepare");
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Note *note=self.listData[indexPath.row];
    cell.textLabel.text=note.content;
    cell.detailTextLabel.text=[note.date description];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
//    return YES;
    return TRUE;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Note *note=self.listData[indexPath.row];
        NoteDao *dao=[NoteDao sharedInstance];
        [dao remove:note];
        self.listData=[dao findAll];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

-(void)reloadView:(NSNotification*)notification{
    NSMutableArray *resList=[notification object];
    self.listData=resList;
    [self.tableView reloadData];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
