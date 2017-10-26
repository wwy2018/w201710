//
//  ViewController.m
//  oneTableView
//
//  Created by wwy on 2017/10/24.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *listTeams;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *plistPath=[[NSBundle mainBundle]pathForResource:@"team" ofType:@"plist"];
    self.listTeams=[[NSArray alloc]initWithContentsOfFile:plistPath];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listTeams count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    NSUInteger row=[indexPath row];
    NSDictionary *rowDict=self.listTeams[row];
    cell.textLabel.text=rowDict[@"name"];
    NSString *imagePath=[[NSString alloc]initWithFormat:@"%@.png", rowDict[@"image"]];
    cell.imageView.image=[UIImage imageNamed:imagePath];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
@end
