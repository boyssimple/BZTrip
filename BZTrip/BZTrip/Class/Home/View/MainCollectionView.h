//
//  MainCollectionView.h
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MainCollectionViewDelegate;
@interface MainCollectionView : UIView
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UICollectionView *funcCollection;
@property (nonatomic, weak) id<MainCollectionViewDelegate> delegate;
+ (CGFloat)calHeight;
@end

@protocol MainCollectionViewDelegate <NSObject>

- (void)functionAction:(NSInteger)index;

@end
