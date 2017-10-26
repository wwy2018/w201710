//
//  ViewController.m
//  audioPro
//
//  Created by wwy on 2017/10/21.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *ss1;
@property (weak, nonatomic) IBOutlet UIButton *ss2;
@property (weak, nonatomic) IBOutlet UIButton *ss3;

@end
// a c++ function
void SoundFinishedPlaying(SystemSoundID sound_id, void *user_data){
    AudioServicesRemoveSystemSoundCompletion(sound_id);
    AudioServicesDisposeSystemSoundID(sound_id);
}
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *audioPath=[[NSBundle mainBundle]pathForResource:@"king" ofType:@"mp3"];
    NSURL *audioUrl=[NSURL fileURLWithPath:audioPath];
    // open
    AudioFileID audioFile;
    AudioFileOpenURL((__bridge CFURLRef)audioUrl, kAudioFileReadPermission, 0, &audioFile);
    // read
    UInt32 dictionarySize=0;
    AudioFileGetPropertyInfo(audioFile, kAudioFilePropertyInfoDictionary, &dictionarySize, 0);
    CFDictionaryRef dictionary;
    AudioFileGetProperty(audioFile, kAudioFilePropertyInfoDictionary, &dictionarySize, &dictionary);
    NSDictionary *audioDic=(__bridge NSDictionary*)dictionary;
    for (int i=0; i<[audioDic allKeys].count; i++) {
        NSString *key=[[audioDic allKeys]objectAtIndex:1];
        NSString *value=[audioDic valueForKey:key];
        NSLog(@"%@=%@",key,value);
    }
    CFRelease(dictionary);
    AudioFileClose(audioFile);
}
- (IBAction)ss1:(id)sender {
    NSString *deviceModel=[[UIDevice currentDevice]model];
    if ([deviceModel isEqualToString:@"iphone"]) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }else{
        UIAlertController *alertCtrl=[UIAlertController alertControllerWithTitle:@"alert" message:@"not support model" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        
        [alertCtrl addAction:defaultAction];
        [self presentViewController:alertCtrl animated:YES completion:nil];
    }
    
}
- (IBAction)ss2:(id)sender {
    // pcm格式 caf
    NSURL *systemSound_url=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"king" ofType:@"mp3"]];
    // create id
    SystemSoundID systemSound_id;
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(systemSound_url), &systemSound_id);
    // register callback
    AudioServicesAddSystemSoundCompletion(systemSound_id, NULL, NULL, SoundFinishedPlaying, NULL);
    // play 手机静音时不会调用
    AudioServicesPlaySystemSound(systemSound_id);
}
- (IBAction)ss3:(id)sender {
    // pcm格式 caf
    NSURL *systemSound_url=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"king" ofType:@"mp3"]];
    // create id
    SystemSoundID systemSound_id;
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(systemSound_url), &systemSound_id);
    // register callback
    AudioServicesAddSystemSoundCompletion(systemSound_id, NULL, NULL, SoundFinishedPlaying, NULL);
    // play 手机静音时震动
    AudioServicesPlayAlertSound(systemSound_id);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
