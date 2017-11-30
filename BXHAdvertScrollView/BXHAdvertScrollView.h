//
//  BXHAdvertScrollView.h
//  BXHAdvertScrollView
//
//  Created by gg on 2017/11/29.
//  Copyright © 2017年 JayS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BXHAdvertScrollView : UIView <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)NSTimer *timer;
//滚动间隔时间 默认为3second
@property (nonatomic,assign)CFTimeInterval scrollViewTimeInterval;

@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)UICollectionViewFlowLayout *collectionVLayout;

- (void)removeTimer;

@end
