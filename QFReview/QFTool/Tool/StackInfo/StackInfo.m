//
//  StackInfo.m
//  Review
//
//  Created by dqf on 2017/7/18.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "StackInfo.h"
#import "AppDelegate.h"

@interface StackInfo ()

@property (nonatomic, strong) UIButton *stackInfoBtn;

@end

@implementation StackInfo

- (UIButton *)stackInfoBtn {
    if (!_stackInfoBtn) {
        _stackInfoBtn = [[UIButton alloc] init];
        [_stackInfoBtn setFrame:CGRectMake(0, 64, 50, 50)];
        [_stackInfoBtn setTitle:@"stack" forState:UIControlStateNormal];
        [_stackInfoBtn.layer setCornerRadius:25];
        [_stackInfoBtn setBackgroundColor:[UIColor redColor]];
        [_stackInfoBtn addTarget:self action:@selector(stackInfoBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestures:)];
        //无论最大还是最小都只允许一个手指
        panGestureRecognizer.minimumNumberOfTouches = 1;
        panGestureRecognizer.maximumNumberOfTouches = 1;
        [_stackInfoBtn addGestureRecognizer:panGestureRecognizer];
        
    }
    return _stackInfoBtn;
}

+ (StackInfo *)share {
    static dispatch_once_t predicate;
    static StackInfo *sm;
    dispatch_once(&predicate, ^{
        sm = [[self alloc] init];
    });
    return sm;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadStackView) name:UIApplicationDidFinishLaunchingNotification object:nil];
    }
    return self;
}

- (void)loadStackView
{
    AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDel.window addSubview:self.stackInfoBtn];
    [appDel.window bringSubviewToFront:self.stackInfoBtn];
}

- (void)stackInfoBtnAction:(id)sender {
    [self logPath];
}

- (void)handlePanGestures:(UIPanGestureRecognizer*)paramSender {
    if (paramSender.state != UIGestureRecognizerStateEnded && paramSender.state != UIGestureRecognizerStateFailed){
        //通过使用 locationInView 这个方法,来获取到手势的坐标
        
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        CGPoint location = [paramSender locationInView:paramSender.view.superview];
        
        if (location.x <=25) {
            location.x = 25;
        }else if (location.x>= screenSize.width-25) {
            location.x = screenSize.width - 25;
        }
        
        if (location.y <=25) {
            location.y = 25;
        }else if (location.y>= screenSize.height-25) {
            location.y = screenSize.height - 25;
        }
        
        paramSender.view.center = location;
    }
}

- (void)logPath {
    
    AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UINavigationController *navi = (UINavigationController *)appDel.window.rootViewController;
    
    NSMutableString *mutableStr = [[NSMutableString alloc] init];
    NSUInteger count = navi.viewControllers.count;
    for (int i=0; i<count; i++) {
        UIViewController *vc = navi.viewControllers[i];
        [mutableStr appendFormat:@"%@->",NSStringFromClass([vc class])];
        
        NSUInteger count2 = vc.childViewControllers.count;
        for (int j=0; j<count2; j++) {
            UIViewController *tmpVC = vc.childViewControllers[j];
            if (tmpVC.isViewLoaded && tmpVC.view.window && !tmpVC.view.hidden) {
                [mutableStr appendFormat:@"%@->",NSStringFromClass([tmpVC class])];
            }
        }
    }
    NSLog(@"StackInfo: \n\n%@\n",mutableStr);

}

@end
