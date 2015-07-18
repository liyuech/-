//
//  FocusTableViewCell.m
//  两栏列表页Demo
//
//  Created by lyc on 15/7/16.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "FocusTableViewCell.h"
#import "Friend.h"

@implementation FocusTableViewCell

#pragma mark bind cell with nib
+ (FocusTableViewCell *)bindWithNib
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FocusTableViewCell" owner:nil options:nil];
    FocusTableViewCell *cell = nib[0];
    return cell;
}

#pragma mark bind information for cell
- (void)bindInfoWithFriend:(Friend *)fd
{
    _name.text = fd.name;
    _headPortrait.image = [UIImage imageNamed:fd.headPortrait];
}

#pragma mark return height of cell
+ (CGFloat)heightOfCell
{
    return 60;
}

@end
