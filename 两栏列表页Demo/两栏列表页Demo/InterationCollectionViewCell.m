//
//  InterationCollectionViewCell.m
//  两栏列表页Demo
//
//  Created by lyc on 15/7/16.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "InterationCollectionViewCell.h"
#import "Friend.h"

@implementation InterationCollectionViewCell

#pragma mark initialize
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"InterationCollectionViewCell" owner:nil options:nil];
        
        InterationCollectionViewCell *cell = nib[0];
        self = cell;
    }
    
    return self;
}

#pragma mark - bind information with Friend Model
- (void)bindInfoWithFriend:(Friend *)fd
{
    _name.text = fd.name;
    _headPortrait.image = [UIImage imageNamed:fd.headPortrait];
}

@end
