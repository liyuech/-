//
//  ViewController.m
//  两栏列表页Demo
//
//  Created by lyc on 15/7/16.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "ViewController.h"

#import "ChooseView.h"
#import "InterationCollectionViewCell.h"
#import "FocusTableViewCell.h"

#import "Friend.h"

#define Width (self.view.bounds.size.width)
#define Height (self.view.bounds.size.height)

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate, ChooseViewDelegate>
{
    UICollectionView *_interationCollectionView;
    UITableView *_focusTableView;
    ChooseView *_topView;
    NSMutableArray *_interationArray;
    NSMutableArray *_focusArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initTopView];
    [self initTableView];
    [self initCollectionView];
}

#pragma mark - initialize top view
- (void)initTopView
{
    _topView = [[ChooseView alloc] init];
    [_topView changesBackgroundColorForButton:_topView.leftButton];
    _topView.delegate = self;
    [self.view addSubview:_topView];
}

#pragma mark - initialize UITableView
- (void)initTableView
{
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 0.5)];
    [tableHeaderView setBackgroundColor:[UIColor lightGrayColor]];
    _focusTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, Width, Height - 60) style:UITableViewStylePlain];
    _focusTableView.tableHeaderView = tableHeaderView;
    _focusTableView.dataSource = self;
    _focusTableView.delegate = self;
    [self.view addSubview:_focusTableView];
    _focusTableView.hidden = YES;
}

#pragma mark - initialize UICollectionView
- (void)initCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _interationCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 60, Width, Height - 60) collectionViewLayout:flowLayout];
    _interationCollectionView.backgroundColor = [UIColor lightGrayColor];
    _interationCollectionView.dataSource = self;
    _interationCollectionView.delegate = self;
    [_interationCollectionView registerClass:[InterationCollectionViewCell class] forCellWithReuseIdentifier:@"InterationCollectionViewCell"];
    [self.view addSubview:_interationCollectionView];
}

#pragma mark - initalize data
- (void)initData
{
    _interationArray = [NSMutableArray arrayWithCapacity:20];
    _focusArray = [NSMutableArray arrayWithCapacity:20];
    for (int i = 0; i < 20; i++) {
        Friend *friend = [[Friend alloc] init];
        friend.name = [NSString stringWithFormat:@"互动^^_%d_^^", i];
        friend.headPortrait = @"boy";
        [_interationArray addObject:friend];
    }
    
    for (int j = 0; j < 20; j++) {
        Friend *friend = [[Friend alloc] init];
        friend.name = [NSString stringWithFormat:@"关注^^_%d_^^", j];
        friend.headPortrait = @"girl";
        [_focusArray addObject:friend];
    }
}

#pragma mark - UICollectionView DataSource Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    InterationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InterationCollectionViewCell" forIndexPath:indexPath];
    if (!cell) {
        NSLog(@"cell no exist");
    }
    Friend *fd = [_interationArray objectAtIndex:indexPath.item];
    [cell bindInfoWithFriend:fd];
    return cell;
}

#pragma mark - UICollectionView UICollectionViewDelegateFlowLayout Methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake(Width, 60);
    return size;
}


#pragma mark - UITableView DataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FocusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FocusTableViewCell class])];
    
    if (nil == cell) {
        cell = [FocusTableViewCell bindWithNib];
    }
    
    Friend *fd = [_focusArray objectAtIndex:indexPath.row];
    [cell bindInfoWithFriend:fd];
    
    return cell;
}

#pragma mark - UITableView delegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [FocusTableViewCell heightOfCell];
}

#pragma mark - ChooseViewDelegate methods
- (void)chooseView:(ChooseView *)chooseView didPressLeftButton:(UIButton *)button
{
    if (YES == _interationCollectionView.hidden) {
        [_topView changesBackgroundColorForButton:_topView.leftButton];
        [_topView changesBackgroundColorForButton:_topView.rightButton];
        _interationCollectionView.hidden = NO;
        _focusTableView.hidden = YES;
    }
}

- (void)chooseView:(ChooseView *)chooseView didPressRightButton:(UIButton *)button
{
    if (YES == _focusTableView.hidden) {
        [_topView changesBackgroundColorForButton:_topView.leftButton];
        [_topView changesBackgroundColorForButton:_topView.rightButton];
        _interationCollectionView.hidden = YES;
        _focusTableView.hidden = NO;
    }
}

@end






