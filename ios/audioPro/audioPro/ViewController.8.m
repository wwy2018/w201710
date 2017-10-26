//
//  ViewController.m
//  audioPro
//
//  Created by wwy on 2017/10/21.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "ViewController.h"
#import "EventCollectionViewCell.h"

#define COL_NUM 3

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) NSArray *events;
@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *plistPath=[[NSBundle mainBundle]pathForResource:@"events" ofType:@"plist"];
    self.events=[[NSArray alloc]initWithContentsOfFile:plistPath];
    [self setupCollectionView];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupCollectionView{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize=CGSizeMake(80, 80);
    layout.sectionInset=UIEdgeInsetsMake(15, 15, 30, 15);
    CGSize screenSize=[UIScreen mainScreen].bounds.size;
    if(screenSize.height > 568) {
        layout.itemSize=CGSizeMake(100, 100);
        layout.sectionInset=UIEdgeInsetsMake(15, 15, 20, 15);
    }
    layout.minimumInteritemSpacing=10;
    self.collectionView=[[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    [self.collectionView registerClass:[EventCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    self.collectionView.backgroundColor=[UIColor whiteColor];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return COL_NUM;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    EventCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    NSInteger idx=indexPath.section*COL_NUM+indexPath.row;
    if(self.events.count <= idx){
        return cell;
    }
    NSDictionary *event=self.events[idx];
    cell.label.text=[event objectForKey:@"name"];
    cell.imageView.image=[UIImage imageNamed:event[@"event"]];
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    int num=[self.events count] % COL_NUM;
    if (num == 0) {
        return [self.events count] / COL_NUM;
    } else {
        return [self.events count] / COL_NUM + 1;
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *event=self.events[indexPath.section*COL_NUM+indexPath.row];
    NSLog(@"select event name: %@", event[@"name"]);
}

@end
