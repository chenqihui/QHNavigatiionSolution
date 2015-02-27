//
//  NextViewController.m
//  QHNavigatiionSolution
//
//  Created by chen on 15/2/27.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

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
}

#pragma mark - action

- (void)nextAction
{
    NextViewController *nextVC = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
    
    nextVC.navigationItem.title = [NSString stringWithFormat:@"hello-%d", self.navigationController.viewControllers.count];
}

@end
