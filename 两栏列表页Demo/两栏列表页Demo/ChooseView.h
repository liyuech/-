//
//  ChooseView.h
//  两栏列表页Demo
//
//  Created by lyc on 15/7/16.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChooseView;
@protocol ChooseViewDelegate <NSObject>

- (void)chooseView:(ChooseView *)chooseView didPressLeftButton:(UIButton *)button;
- (void)chooseView:(ChooseView *)chooseView didPressRightButton:(UIButton *)button;

@end

@interface ChooseView : UIView

#pragma mark left button
@property (strong, nonatomic) UIButton *leftButton;

#pragma mark right button
@property (strong, nonatomic) UIButton *rightButton;

#pragma mark ChooseView delegate
@property (strong, nonatomic) id <ChooseViewDelegate> delegate;

#pragma mark changes button background color
- (void)changesBackgroundColorForButton:(UIButton *)button;

@end
