//
//  SlideMenuViewController.m
//  matchCorner
//
//  Created by wwy on 2017/10/25.
//  Copyright © 2017年 wwy. All rights reserved.
//

#import "SlideMenuViewController.h"
#import "./Macro/UtilsMacro.h"

@interface SlideMenuViewController ()
@property(nonatomic,weak)IBOutlet UIView *menuContainer;
@property(nonatomic,weak)IBOutlet UIView *contentContainer;
@property(nonatomic,strong)UIButton *maskButton;
@property(nonatomic,assign)BOOL folded;
@property(nonatomic,assign)CGPoint originalPoint;
@property(nonatomic,assign)CGFloat scaleFactor;
@property(nonatomic,assign)CGFloat offsetX;
@property(nonatomic,assign)CGFloat originalX;
@property(nonatomic,assign)CGFloat deltaScaleFactor;
@property(nonatomic,assign)CGFloat deltaAlphaFactor;
@property(nonatomic,assign)CGFloat miniumOffsetX;

@end

@implementation SlideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initParams];
}
-(void)switchController{
    _folded=!_folded;
    if(_folded){
        [self showContentViewController];
    }else{
        [self showMenuViewController];
    }
}
#pragma mark - Private
-(void)initParams{
    _folded=YES;
    _scaleFactor=0.95;
    _offsetX=self.view.frame.size.width/2 + 30;
    _deltaAlphaFactor=1/_offsetX;
    _miniumOffsetX=_offsetX/2;
    _deltaAlphaFactor=(1-_scaleFactor)/_offsetX;
}
-(void)showContentViewController{
    [self setShadowVisible:NO];
    CGAffineTransform transform=CGAffineTransformMakeTranslation(_offsetX, 0);
    transform=CGAffineTransformScale(transform, _scaleFactor, _scaleFactor);
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.menuContainer.alpha=0;
        self.contentContainer.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished){
        [self setMaskButtonVisible:NO];
    }];
}
-(void)showMenuViewController{
    [self setShadowVisible:YES];
    CGAffineTransform transform=CGAffineTransformMakeTranslation(_offsetX, 0);
    transform=CGAffineTransformScale(transform, _scaleFactor, _scaleFactor);
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.menuContainer.alpha=1;
        self.contentContainer.transform=transform;
    } completion:^(BOOL finished){
        [self setMaskButtonVisible:YES];
    }];
}
-(void)setShadowVisible:(BOOL)visible{
    if (visible) {
        UIBezierPath *path=[UIBezierPath bezierPathWithRect:_contentContainer.layer.bounds];
        _contentContainer.layer.shadowPath=path.CGPath;
        _contentContainer.layer.shadowColor=[UIColor blackColor].CGColor;
        _contentContainer.layer.shadowOffset=CGSizeZero;
        _contentContainer.layer.shadowOpacity=0.4;
        _contentContainer.layer.shadowRadius=4.5;
    }else{
        _contentContainer.layer.shadowRadius=0;
    }
}
-(void)setMaskButtonVisible:(BOOL)visible{
    if (_maskButton==nil) {
        self.maskButton=[UIButton buttonWithType:UIButtonTypeSystem];
        [_maskButton addTarget:self action:@selector(maskButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [_contentContainer addSubview:_maskButton];
    }
    _maskButton.hidden=!visible;
}
-(IBAction)panned:(UIPanGestureRecognizer *)sender{
    CGPoint point=[sender locationInView:self.view];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            _originalPoint=point;
            [self setShadowVisible:YES];
            break;
        case UIGestureRecognizerStateChanged:{
            CGFloat tx=point.x-self.originalPoint.x+self.originalX;
            tx=tx<0?0:tx;
            CGFloat s=1-tx*self.deltaScaleFactor;
            s=s<0?0:s;
            CGAffineTransform transform=CGAffineTransformMakeTranslation(tx, 0);
            transform=CGAffineTransformScale(transform, s, s);
            _contentContainer.transform=transform;
            CGFloat alpha=tx*self.deltaScaleFactor;
            alpha=alpha>1?1:alpha;
            _menuContainer.alpha=alpha;
        } break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:{
            CGAffineTransform transform=_contentContainer.transform;
            if (transform.tx>=self.miniumOffsetX) {
                self.folded=NO;
                [self showMenuViewController];
            } else {
                self.folded=YES;
                [self showContentViewController];
            }
        } break;
            
            
            
        default:
            NSLog(@"other touch");
            break;
    }
}
-(CGFloat)originalX{
    return (_folded ? 0 : _offsetX);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
