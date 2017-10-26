//
//  ViewController.m
//  audioPro
//
//  Created by wwy on 2017/10/21.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()<MPMediaPickerControllerDelegate> {
    // 定义实例
    MPMediaPickerController *musicVC;
    MPMusicPlayerController *musicPlayVC;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // pick music
    NSLog(@"ok");
    musicVC = [[MPMediaPickerController alloc]initWithMediaTypes:MPMediaTypeAnyAudio];
    musicVC.delegate=self;
    musicVC.prompt=@"pls pick music";
    [self.navigationController presentViewController:musicVC animated:true completion:nil];
    NSLog(@"%@",self.navigationController);
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
    musicPlayVC =[[MPMusicPlayerController alloc]init];
    [musicPlayVC setQueueWithItemCollection:mediaItemCollection];
    [musicPlayVC play];
}
- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    NSLog(@"cancel pick");
    [mediaPicker dismissViewControllerAnimated:true completion:nil];
}

@end
