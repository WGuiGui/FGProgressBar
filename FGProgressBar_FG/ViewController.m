//
//  ViewController.m
//  FGProgressBar_FG
//
//  Created by wangguigui on 16/8/10.
//  Copyright © 2016年 topsci. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"

@interface ViewController ()
@property (nonatomic, strong) ProgressView * progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.progressView = [[ProgressView alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 30) stepsNumber:10 currentStep:0];
    [self.view addSubview:self.progressView];
}

-(IBAction)previousStep:(id)sender
{
    [self.progressView previousStep];
}

-(IBAction)nextStep:(id)sender
{
    [self.progressView nextStep];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
