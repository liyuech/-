//
//  InterationCollectionViewCell.h
//  两栏列表页Demo
//
//  Created by lyc on 15/7/16.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Friend;
@interface InterationCollectionViewCell : UICollectionViewCell

#pragma mark head portrait
@property (weak, nonatomic) IBOutlet UIImageView *headPortrait;

#pragma mark name
@property (weak, nonatomic) IBOutlet UILabel *name;

#pragma mark - bind information with Friend Model
- (void)bindInfoWithFriend:(Friend *)fd;

@end
