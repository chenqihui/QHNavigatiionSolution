//
//  ViewController.m
//  QHNavigatiionSolution
//
//  Created by chen on 15/2/27.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "ViewController.h"

#import "MLBlackTransition.h"
#import "LRNavigationController.h"
#import "QHMainGestureRecognizerViewController.h"

#import "NextViewController.h"
#import "Next2ViewController.h"
#import "Next3ViewController.h"
#import "Next4ViewController.h"

@interface ViewController () //UINavigationControllerDelegate>
{
    UINavigationController *_originalNaviC;
    UINavigationController *_customNaviBar;
    LRNavigationController *_customNaviC;
    QHMainGestureRecognizerViewController *_mainGestureRecognizerVC;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - action

- (IBAction)originalNavCAction:(id)sender
{
    NextViewController *mainVC = [[NextViewController alloc] init];
    _originalNaviC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [_originalNaviC.view setFrame:self.view.bounds];
    [self.view addSubview:_originalNaviC.view];
    [self addChildViewController:_originalNaviC];
    
    mainVC.navigationItem.title = ((UIButton *)sender).titleLabel.text;
    UIBarButtonItem *closeBtn = [[UIBarButtonItem alloc] initWithTitle:@"close" style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(close:)];
    mainVC.navigationItem.leftBarButtonItem = closeBtn;
}

- (IBAction)customNaviBarAction:(id)sender
{
    [MLBlackTransition validatePanPackWithMLBlackTransitionGestureRecognizerType:MLBlackTransitionGestureRecognizerTypePan];
    
    Next2ViewController *mainVC = [[Next2ViewController alloc] init];
    _customNaviBar = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [_customNaviBar.view setFrame:self.view.bounds];
    //隐藏导航的bar
    [_customNaviBar setNavigationBarHidden:YES animated:NO];
    //屏蔽系统默认的手势返回
    _customNaviBar.interactivePopGestureRecognizer.enabled = NO;
    [self.view addSubview:_customNaviBar.view];
    [self addChildViewController:_customNaviBar];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(10, 30, 100, 30);
    [closeBtn setTitle:@"close" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mainVC.view addSubview:closeBtn];
    
    [closeBtn addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)customNaviCAction:(id)sender
{
    Next3ViewController *mainVC = [[Next3ViewController alloc] init];
    _customNaviC = [[LRNavigationController alloc] initWithRootViewController:mainVC];
    [_customNaviC.view setFrame:self.view.bounds];
    //隐藏导航的bar
    [_customNaviC setNavigationBarHidden:YES animated:NO];
    //屏蔽系统默认的手势返回
    _customNaviC.interactivePopGestureRecognizer.enabled = NO;
    _customNaviC.contentScale=0.8;
    _customNaviC.judgeOffset=100;
    _customNaviC.startX=0;
    [self.view addSubview:_customNaviC.view];
    [self addChildViewController:_customNaviC];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(10, 30, 100, 30);
    [closeBtn setTitle:@"close" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mainVC.view addSubview:closeBtn];
    
    [closeBtn addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)qhMainGestureRecognizerVC:(id)sender
{
    Next4ViewController *mainVC = [[Next4ViewController alloc] init];
    
    _mainGestureRecognizerVC = [[QHMainGestureRecognizerViewController alloc] init];
    [_mainGestureRecognizerVC.view setFrame:self.view.bounds];
    _mainGestureRecognizerVC.moveType = moveTypeMove;
    [self.view addSubview:_mainGestureRecognizerVC.view];
    [self addChildViewController:_mainGestureRecognizerVC];
    
    [_mainGestureRecognizerVC addViewController2Main:mainVC];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(10, 30, 100, 30);
    [closeBtn setTitle:@"close" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mainVC.view addSubview:closeBtn];
    
    [closeBtn addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)close:(id)sender
{
    if (_originalNaviC != nil)
    {
        [_originalNaviC.view removeFromSuperview];
        [_originalNaviC removeFromParentViewController];
        _originalNaviC = nil;
    }
    
    if (_customNaviBar != nil)
    {
        [_customNaviBar.view removeFromSuperview];
        [_customNaviBar removeFromParentViewController];
        _customNaviBar = nil;
    }
    
    if (_customNaviC != nil)
    {
        [_customNaviC.view removeFromSuperview];
        [_customNaviC removeFromParentViewController];
        _customNaviC = nil;
    }
    
    if (_mainGestureRecognizerVC != nil)
    {
        [_mainGestureRecognizerVC.view removeFromSuperview];
        [_mainGestureRecognizerVC removeFromParentViewController];
        _mainGestureRecognizerVC = nil;
    }
}

//#pragma mark - UINavigationControllerDelegate
//
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    if ( viewController == rootViewController) {
//        [navigationController setNavigationBarHidden:YES animated:animated];
//    } else if ( [navigationController isNavigationBarHidden] ) {
//        [navigationController setNavigationBarHidden:NO animated:animated];
//    }
//}

@end
