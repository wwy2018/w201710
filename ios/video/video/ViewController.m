//
//  ViewController.m
//  video
//
//  Created by wwy on 12/11/2017.
//  Copyright © 2017 wwy. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *movie=@"bg.mp4";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSError *)nativeTransferMovie:(NSString *)movie toImagesAtPath:(NSString *)imagesPath
{
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL fileURLWithPath:movie] options:nil];
    AVAssetImageGenerator *generator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    CMTime time = asset.duration;
    NSUInteger totalFrameCount = CMTimeGetSeconds(time) * kKTImagesMovieTransferFPS;
    NSMutableArray *timesArray = [NSMutableArray arrayWithCapacity:totalFrameCount];
    for (NSUInteger ii = 0; ii < totalFrameCount; ++ii) {
        CMTime timeFrame = CMTimeMake(ii, kKTImagesMovieTransferFPS);
        NSValue *timeValue = [NSValue valueWithCMTime:timeFrame];
        [timesArray addObject:timeValue];
    }
    generator.requestedTimeToleranceBefore = kCMTimeZero;
    generator.requestedTimeToleranceAfter = kCMTimeZero;
    __block NSError *returnError = nil;
    [generator generateCGImagesAsynchronouslyForTimes:timesArray completionHandler:^(CMTime requestedTime, CGImageRef  _Nullable image, CMTime actualTime, AVAssetImageGeneratorResult result, NSError * _Nullable error) {
        switch (result) {
                
            case AVAssetImageGeneratorFailed:
                returnError = error;
                [self sendToMainThreadError:returnError];
                break;
                
            case AVAssetImageGeneratorSucceeded:
            {
                NSString *imageFile = [imagesPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%lld.jpg", requestedTime.value]];
                NSData *data = UIImageJPEGRepresentation([UIImage imageWithCGImage:image], 1.0);
                if ([data writeToFile:imageFile atomically:YES]) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if ([self.delegate respondsToSelector:@selector(transfer:didTransferedAtIndex:totalFrameCount:)]) {
                            [self.delegate transfer:self didTransferedAtIndex:requestedTime.value totalFrameCount:totalFrameCount];
                        }
                    });
                    NSUInteger index = requestedTime.value;
                    if (index == totalFrameCount - 1) {
                        if ([self.delegate respondsToSelector:@selector(transfer:didFinishedWithError:)]) {
                            [self.delegate transfer:self didFinishedWithError:nil];
                        }
                    }
                } else {
                    returnError = [self errorWithErrorCode:KTTransferWriteError object:imageFile];
                    [self sendToMainThreadError:returnError];
                    [generator cancelAllCGImageGeneration];
                }
            }
                break;
                
            default:
                break;
        }
    }];
    
    return returnError;
}


@end
