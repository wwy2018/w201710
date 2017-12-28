//
//  ViewController.m
//  ScrollViewSample
//
//  Created by wwy on 27/10/2017.
//  Copyright © 2017 wwy. All rights reserved.
//

#import "ViewController.h"
#define S_WIDTH [[UIScreen mainScreen]bounds].size.width
#define S_HEIGHT [[UIScreen mainScreen]bounds].size.height

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) UIImageView *imageView1;
@property (strong, nonatomic) UIImageView *imageView2;
@property (strong, nonatomic) UIImageView *imageView3;
- (IBAction)valueChanged:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.delegate=self;
    self.scrollView.contentSize=CGSizeMake(S_WIDTH*3, S_HEIGHT);
    self.scrollView.frame=self.view.frame;
    self.imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, S_WIDTH, S_HEIGHT)];
    self.imageView1.image=[UIImage imageNamed:@"达芬奇-蒙娜丽莎.png"];
    self.imageView2=[[UIImageView alloc]initWithFrame:CGRectMake(S_WIDTH, 0.0f, S_WIDTH, S_HEIGHT)];
    self.imageView2.image=[UIImage imageNamed:@"罗丹-思想者.png"];
    self.imageView3=[[UIImageView alloc]initWithFrame:CGRectMake(2*S_WIDTH, 0.0f, S_WIDTH, S_HEIGHT)];
    self.imageView3.image=[UIImage imageNamed:@"保罗克利-肖像.png"];
    [self.scrollView addSubview:self.imageView1];
    [self.scrollView addSubview:self.imageView2];
    [self.scrollView addSubview:self.imageView3];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset=scrollView.contentOffset;
    self.pageControl.currentPage=offset.x/S_WIDTH;
}

- (IBAction)valueChanged:(id)sender {
    [UIView animateWithDuration:0.3f animations:^{
        NSInteger whichPage=self.pageControl.currentPage;
        self.scrollView.contentOffset=CGPointMake(S_WIDTH*whichPage, 0.0f);
    }];
}
@end
