//
//  BXHAdvertScrollView.m
//  BXHAdvertScrollView
//
//  Created by gg on 2017/11/29.
//  Copyright © 2017年 JayS. All rights reserved.
//

#import "BXHAdvertScrollView.h"

@interface AdverNormalCollectionCell : UICollectionViewCell

@end

@implementation AdverNormalCollectionCell



@end

static NSString *const advertCollectionVReuseIdentifier = @"advertCollectionVReuseIdentifier";

@implementation BXHAdvertScrollView


- (instancetype)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    if(self)
    {
        [self initialization];
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    [self addSubview:self.collectionView];
}

- (void)layoutSubviews
{
    //一定要设置 itemsize 不然不走 cellforitematindexpath方法
    self.collectionVLayout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    self.collectionView.frame = self.bounds;
}

- (void)initialization
{
    self.scrollViewTimeInterval = 3.0;
    [self addTimer];
}

- (void)addTimer
{
    self.timer = [NSTimer timerWithTimeInterval:self.scrollViewTimeInterval target:self selector:@selector(beginUpdateUI) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)beginUpdateUI
{
    NSLog(@"I am a timer ");
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    //关键句 collectionView api scrollToItemAtIndexPath-> 通过动画滚动到下一个位置
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:YES];

}

- (void)removeTimer
{
    [self.timer invalidate];  // 真正销毁NSTimer对象的地方
    self.timer = nil; // 对象置nil是一种规范和习惯
}


- (UICollectionView *)collectionView
{
    if(!_collectionView)
    {
        self.collectionVLayout = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.collectionVLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
        _collectionView.pagingEnabled = NO;
        [_collectionView registerClass:[AdverNormalCollectionCell class] forCellWithReuseIdentifier:advertCollectionVReuseIdentifier];
        
    }
    
    return _collectionView;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AdverNormalCollectionCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:advertCollectionVReuseIdentifier forIndexPath:indexPath];
    
    UILabel *testLabel = [[UILabel alloc]init];
    testLabel.frame = CGRectMake(0, 0, 200, 200);
    
    if(indexPath.section == 1)
    {
        testLabel.text = @"热门广告22222222222222222222222222222222222";
    }else{
    testLabel.text = @"头条广告11111111111111111111111111111111111111111111z";
    }
    testLabel.backgroundColor = [UIColor orangeColor];
    [testLabel sizeToFit];
    [collectionViewCell addSubview:testLabel];
    
    return collectionViewCell;
}


@end
