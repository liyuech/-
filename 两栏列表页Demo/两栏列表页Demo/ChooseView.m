//
//  ChooseView.m
//  两栏列表页Demo
//
//  Created by lyc on 15/7/16.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "ChooseView.h"

#define Width ([UIScreen mainScreen].bounds.size.width)

@implementation ChooseView

#pragma mark - initialize
- (id)init
{
    self = [super init];
    
    if (self) {
        self.frame = CGRectMake(0, 20, Width, 40);
        [self setBackgroundColor:[UIColor orangeColor]];
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake((Width - 80)/2, 5, 40, 30)];
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake((Width - 80)/2 + 40, 5, 40, 30)];
        [_leftButton setTitle:@"互动" forState:UIControlStateNormal];
        [_rightButton setTitle:@"关注" forState:UIControlStateNormal];
        [_leftButton.layer setMasksToBounds:YES];
        [_rightButton.layer setMasksToBounds:YES];
        [_leftButton.layer setCornerRadius:5.0];
        [_rightButton.layer setCornerRadius:5.0];
        [_leftButton.layer setBorderWidth:0.5];
        [_rightButton.layer setBorderWidth:0.5];
        [_leftButton.layer setBorderColor:[UIColor grayColor].CGColor];
        [_rightButton.layer setBorderColor:[UIColor grayColor].CGColor];
        [_leftButton addTarget:self action:@selector(leftButtonPress) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton addTarget:self action:@selector(rightButtonPress) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftButton];
        [self addSubview:_rightButton];
    }
    
    return self;
}

#pragma mark - left button press
- (void)leftButtonPress
{
    if ([_delegate respondsToSelector:@selector(chooseView:didPressLeftButton:)]) {
        [self.delegate chooseView:self didPressLeftButton:_leftButton];
    }
}

#pragma mark - right button press
- (void)rightButtonPress
{
    if ([_delegate respondsToSelector:@selector(chooseView:didPressRightButton:)]) {
        [self.delegate chooseView:self didPressRightButton:_rightButton];
    }
}

#pragma mark - left button background color change
- (void)changesBackgroundColorForButton:(UIButton *)button
{
    if (![button.backgroundColor isEqual:[UIColor redColor]]) {
        [button setBackgroundColor:[UIColor redColor]];
    } else {
        [button setBackgroundColor:[UIColor clearColor]];
    }
}

@end
