//
//  MainCollectionView.m
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "MainCollectionView.h"
#import "MainCollecCell.h"
#import "MainFunc.h"

@interface MainCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation MainCollectionView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.funcCollection];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MainCollecCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainCollecCell" forIndexPath:indexPath];
    MainFunc *func = [self.dataSource objectAtIndex:indexPath.row];
    [cell updateData:func];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat mw = 30*5;
    CGFloat w = (DEVICEWIDTH - mw)/4;
    return (CGSize){w,w+20};
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r = self.funcCollection.frame;
    r.origin.x = 0;
    r.origin.y = 0;
    r.size.width = self.width;
    r.size.height = self.height;
    self.funcCollection.frame = r;
}

//功能区collectionview
- (UICollectionView*)funcCollection{
    if (!_funcCollection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 30;
        layout.sectionInset = UIEdgeInsetsMake(10, 30, 10, 30);
        CGRect f = CGRectMake(0, 0, self.width, self.height);
        _funcCollection = [[UICollectionView alloc]initWithFrame:f collectionViewLayout:layout];
        [_funcCollection registerClass:[MainCollecCell class] forCellWithReuseIdentifier:@"MainCollecCell"];
        _funcCollection.delegate = self;
        _funcCollection.dataSource = self;
        _funcCollection.backgroundColor = [UIColor clearColor];
    }
    return _funcCollection;
}


+ (CGFloat)calHeight{
    CGFloat mw = 30*5;
    CGFloat w = (DEVICEWIDTH - mw)/4;
    CGFloat height = (w +20) *2 + 30;
    return height;
}
@end
