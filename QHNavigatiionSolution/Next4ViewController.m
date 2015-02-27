//
//  Next4ViewController.m
//  QHNavigatiionSolution
//
//  Created by chen on 15/2/27.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "Next4ViewController.h"

#import "QHMainGestureRecognizerViewController.h"

@interface Next4ViewController ()

@end

@implementation Next4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake(0, 0, 100, 30);
    nextBtn.center = self.view.center;
    [nextBtn setTitle:@"next" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:nextBtn];
    
    [nextBtn addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    
    if ([QHMainGestureRecognizerViewController getMainGRViewCtrl].arViewControllers.count != 0)
    {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(10, 30, 100, 30);
        [backBtn setTitle:@"back" forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:backBtn];
        
        [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark - action

- (void)nextAction
{
    Next4ViewController *nextVC = [[Next4ViewController alloc] init];
    [[QHMainGestureRecognizerViewController getMainGRViewCtrl] addViewController2Main:nextVC];
}

- (void)backAction
{
    [[QHMainGestureRecognizerViewController getMainGRViewCtrl] popViewController2Parent];
}

@end
