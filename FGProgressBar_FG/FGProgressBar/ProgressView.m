//
//  ProgressView.m
//  ProgressBar
//
//  Created by wangguigui on 16/8/8.
//  Copyright © 2016年 topsci. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

#define CurrentStepBtnW 30
#define CurrentStepBtnY 0
#define StepBtnW 20
#define StepBtnY 5

-(id)initWithFrame:(CGRect)frame stepsNumber:(NSInteger)steps currentStep:(NSInteger)currentStep;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.stepLabelArray = [NSMutableArray array];
        self.steps = steps;
        self.currentStep = currentStep;
        [self addSubViews];
    }
    return self;
}


-(void)addSubViews
{
    self.barBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, CurrentStepBtnW)];
    self.barBackView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.barBackView];
    
    UIView * indicatorView = [[UIView alloc]initWithFrame:CGRectMake(CurrentStepBtnW, self.barBackView.frame.size.height/2 - 3, self.barBackView.frame.size.width-2*CurrentStepBtnW, 6)];
    indicatorView.backgroundColor = [UIColor lightGrayColor];
    indicatorView.layer.masksToBounds = YES;
    indicatorView.layer.cornerRadius = 3;
    [self.barBackView addSubview:indicatorView];
    
    for (int i = 0; i<self.steps; i++) {
        UIButton * stepbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [stepbtn setTitle:[NSString stringWithFormat:@"%zd",i+1] forState:UIControlStateNormal];
        stepbtn.titleLabel.font = [UIFont systemFontOfSize:12];
        stepbtn.backgroundColor = [UIColor lightGrayColor];
        CGRect frame = stepbtn.frame;
        if (i <self.currentStep) {
            frame.size.height = StepBtnW;
            frame.size.width = StepBtnW;
            frame.origin.y = StepBtnY;
            frame.origin.x = 0;
        } else if (i == self.currentStep) {
            frame.size.height = CurrentStepBtnW;
            frame.size.width = CurrentStepBtnW;
            frame.origin.y = CurrentStepBtnY;
            frame.origin.x = 2*CurrentStepBtnW;
        } else if (i == self.currentStep+1){
            frame.size.height = StepBtnW;
            frame.size.width = StepBtnW;
            frame.origin.y = StepBtnY;
            frame.origin.x = self.barBackView.frame.size.width/2 - frame.size.width/2;
        } else if (i == self.currentStep+2){
            frame.size.height = StepBtnW;
            frame.size.width = StepBtnW;
            frame.origin.y = StepBtnY;
            frame.origin.x = self.barBackView.frame.size.width - frame.size.width - 2*CurrentStepBtnW;
        } else {
            frame.size.height = StepBtnW;
            frame.size.width = StepBtnW;
            frame.origin.y = StepBtnY;
            frame.origin.x = self.barBackView.frame.size.width - CurrentStepBtnW;
        }
        if (i == self.currentStep) {
            stepbtn.backgroundColor = [UIColor greenColor];
        } else {
            stepbtn.backgroundColor = [UIColor lightGrayColor];
        }
        
        stepbtn.frame = frame;
        stepbtn.layer.masksToBounds = YES;
        stepbtn.layer.cornerRadius = stepbtn.frame.size.width/2;
        [self.barBackView addSubview:stepbtn];
        [self.stepLabelArray addObject:stepbtn];
    }
    
    UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CurrentStepBtnW, CurrentStepBtnW)];
    leftView.backgroundColor = [UIColor whiteColor];
    [self.barBackView addSubview:leftView];
    
    UIView * rightView = [[UIView alloc]initWithFrame:CGRectMake(self.barBackView.frame.size.width - CurrentStepBtnW, 0, CurrentStepBtnW, CurrentStepBtnW)];
    rightView.backgroundColor = [UIColor whiteColor];
    [self.barBackView addSubview:rightView];
}

-(void)previousStep
{
    if (self.currentStep == 0) {
        return;
    }
    self.currentStep-=1;
    for (int i = ((int)self.steps-1); i<self.stepLabelArray.count; i--) {
        UIButton * btn = self.stepLabelArray[i];
        CGRect frame = btn.frame;
        if (i > self.currentStep+1) {
            frame.size.width = StepBtnW;
            frame.size.height = StepBtnW;
            frame.origin.y = StepBtnY;
            frame.origin.x = self.barBackView.frame.size.width-CurrentStepBtnW;
        } else if (i == self.currentStep+1) {
            frame.size.width = StepBtnW;
            frame.size.height = StepBtnW;
            frame.origin.y = StepBtnY;
            frame.origin.x = self.barBackView.frame.size.width-2*CurrentStepBtnW - frame.size.width;
        } else if (i == self.currentStep) {
            frame.size.width = CurrentStepBtnW;
            frame.size.height = CurrentStepBtnW;
            frame.origin.y = CurrentStepBtnY;
            frame.origin.x = self.barBackView.frame.size.width/2-frame.size.width/2;
        } else if (i == self.currentStep-1) {
            frame.size.width = StepBtnW;
            frame.size.height = StepBtnW;
            frame.origin.y = StepBtnY;
            frame.origin.x = 2*CurrentStepBtnW;
        } else {
            frame.size.width = StepBtnW;
            frame.size.height = StepBtnW;
            frame.origin.y = StepBtnY;
            frame.origin.x = 0;
        }
        if (i == self.currentStep) {
            btn.backgroundColor = [UIColor greenColor];
        } else {
            btn.backgroundColor = [UIColor lightGrayColor];
        }
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = frame.size.width/2;
        [UIView animateWithDuration:0.5 animations:^{
            [btn setFrame:frame];
        }];
    }
}

-(void)nextStep
{
    if (self.currentStep>=self.steps-1) {
        return;
    }
    self.currentStep+=1;
    for (int i = 0; i<self.stepLabelArray.count; i++) {
        UIButton * btn = self.stepLabelArray[i];
        CGRect frame = btn.frame;
        
        if (i>self.currentStep+1) {
            frame.size.width = StepBtnW;
            frame.size.height = StepBtnW;
            frame.origin.y = StepBtnY;
            frame.origin.x = self.barBackView.frame.size.width - 30;
            
        } else if (i == self.currentStep+1) {
            frame.size.width = StepBtnW;
            frame.size.height = StepBtnW;
            frame.origin.y = StepBtnY;
            frame.origin.x = self.barBackView.frame.size.width-frame.size.width - 60;
            
        } else if (i == self.currentStep) {
            frame.size.width = CurrentStepBtnW;
            frame.size.height = CurrentStepBtnW;
            frame.origin.y = CurrentStepBtnY;
            frame.origin.x = self.barBackView.frame.size.width/2-frame.size.width/2;
            
        } else if (i == self.currentStep-1) {
            frame.size.width = StepBtnW;
            frame.size.height = StepBtnW;
            frame.origin.y = StepBtnY;
            frame.origin.x = CurrentStepBtnW*2;
        } else {
            frame.size.width = StepBtnW;
            frame.size.height = StepBtnW;
            frame.origin.y = StepBtnY;
            frame.origin.x = 0;
        }
        if (i == self.currentStep) {
            btn.backgroundColor = [UIColor greenColor];
        } else {
            btn.backgroundColor = [UIColor lightGrayColor];
        }
        btn.layer.cornerRadius = frame.size.width/2;
        [UIView animateWithDuration:0.5 animations:^{
            [btn setFrame:frame];
        }];
    }
}


-(void)setCurrentStep:(NSInteger)currentStep
{
    _currentStep = currentStep;
}

-(void)setSteps:(NSInteger)steps
{
    _steps = steps;
}

@end
