//
//  MainCollectionView.m
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "MainFourModalView.h"
#import "MainFourCell.h"
#import "MainFunc.h"

@interface MainFourModalView()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation MainFourModalView

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
    MainFourCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainFourCell" forIndexPath:indexPath];
    NSString *func = [self.dataSource objectAtIndex:indexPath.row];
    [cell updateData:func];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat mw = 20*3;
    CGFloat w = (DEVICEWIDTH - mw)/2;
    return (CGSize){w,60*RATIO_WIDHT320};
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
        layout.minimumInteritemSpacing = 20;
        layout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
        CGRect f = CGRectMake(0, 0, self.width, self.height);
        _funcCollection = [[UICollectionView alloc]initWithFrame:f collectionViewLayout:layout];
        [_funcCollection registerClass:[MainFourCell class] forCellWithReuseIdentifier:@"MainFourCell"];
        _funcCollection.delegate = self;
        _funcCollection.dataSource = self;
        _funcCollection.backgroundColor = RGB3(241);
    }
    return _funcCollection;
}


+ (CGFloat)calHeight{
    CGFloat height = 60*RATIO_WIDHT320*2 + 30;
    return height;
}
@end
