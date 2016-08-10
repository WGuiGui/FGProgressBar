//
//  ProgressView.h
//  ProgressBar
//
//  Created by wangguigui on 16/8/8.
//  Copyright © 2016年 topsci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView
@property (nonatomic, strong) UIView * barBackView;
@property (nonatomic, assign) NSInteger steps;
@property (nonatomic, assign) NSInteger currentStep;
@property (nonatomic, strong) NSMutableArray * stepLabelArray;

-(id)initWithFrame:(CGRect)frame stepsNumber:(NSInteger)steps currentStep:(NSInteger)currentStep;

-(void)previousStep;
-(void)nextStep;

@end
