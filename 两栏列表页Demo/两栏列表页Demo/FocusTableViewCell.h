//
//  FocusTableViewCell.h
//  两栏列表页Demo
//
//  Created by lyc on 15/7/16.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Friend;
@interface FocusTableViewCell : UITableViewCell

#pragma mark name label
@property (weak, nonatomic) IBOutlet UILabel *name;

#pragma mark head portrait label
@property (weak, nonatomic) IBOutlet UIImageView *headPortrait;

#pragma mark bind cell with nib
+ (FocusTableViewCell *)bindWithNib;

#pragma mark return height of cell
+ (CGFloat)heightOfCell;

#pragma mark bind information for cell
- (void)bindInfoWithFriend:(Friend *)fd;

@end
