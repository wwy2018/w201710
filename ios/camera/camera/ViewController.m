//
//  ViewController.m
//  camera
//
//  Created by wwy on 12/11/2017.
//  Copyright © 2017 wwy. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if ([self isCameravail]) {
        NSLog(@"camera avail");
    }else{
        NSLog(@"camera not avail");
    }
    // image video
    if ([self cameraSupportMedia:(__bridge NSString*)kUTTypeImage]) {
        NSLog(@"support taking photo");
    }else{
        NSLog(@"not support taking photo");
    }
    if ([self cameraSupportMedia:(__bridge NSString*)kUTTypeMovie]) {
        NSLog(@"support record");
    }else{
        NSLog(@"not support record");
    }
    [self configImagePickerController];
}
-(void)configImagePickerController{
    UIImagePickerController *controller=[[UIImagePickerController alloc]init];
    controller.sourceType=UIImagePickerControllerSourceTypeCamera;
    NSString *requireMediaType=(__bridge NSString*)kUTTypeImage;
    controller.mediaTypes=[[NSArray alloc]initWithObjects:requireMediaType, nil];
    controller.allowsEditing=false;
    controller.delegate=self;
    controller.cameraFlashMode=UIImagePickerControllerCameraFlashModeOn;
    
    [self.navigationController presentViewController:controller animated:true completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:true completion:nil];
}
-(BOOL)isCameravail{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}
-(BOOL)cameraSupportMedia:(NSString*)paraMediaType{
    NSArray *availableMedia=[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    for (NSString *item in availableMedia) {
        if ([item isEqualToString:paraMediaType]) {
            return true;
        }
    }
    return false;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
