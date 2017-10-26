//
//  ViewController.m
//  audioPro
//
//  Created by wwy on 2017/10/21.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () {
    AVAudioPlayer *audioPlayer;
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet UITextView *text_view;
@property (weak, nonatomic) IBOutlet UIProgressView *audioProgress;
@property (weak, nonatomic) IBOutlet UISlider *audioTime;
@property (weak, nonatomic) IBOutlet UIStepper *cyc;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)audioPlay:(id)sender {
    NSString *playmusicPath=[[NSBundle mainBundle]pathForResource:@"king" ofType:@"mp3"];
    if (playmusicPath) {
        [[AVAudioSession sharedInstance]setCategory:AVAudioSessionCategoryPlayback error:nil];
        NSURL *musicUrl=[NSURL fileURLWithPath:playmusicPath];
        audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:musicUrl error:nil];
        audioPlayer.delegate=self;
        audioPlayer.meteringEnabled=YES;
        timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(monitor) userInfo:nil repeats:YES];
        [audioPlayer play];
    }
}

- (IBAction)audioPause:(id)sender {
}

- (IBAction)audioStop:(id)sender {
}

- (IBAction)audioSwitch:(id)sender {
}

- (IBAction)audioCyc:(id)sender {
}

- (IBAction)audioVol:(id)sender {
}

- (IBAction)audioPlayAtTime:(id)sender {
}
# delegate func
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
}


- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error{
    
}


- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player{
    
}

@end
