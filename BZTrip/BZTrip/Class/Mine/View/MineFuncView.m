//
//  MineFuncView.m
//  BZTrip
//
//  Created by zhouMR on 16/10/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "MineFuncView.h"
#import "MineFuncCell.h"

@interface MineFuncView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collView;

@end
@implementation MineFuncView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collView];
    }
    return self;
}

- (void)setDataSource:(NSMutableArray *)dataSource{
    _dataSource = dataSource;
    [self.collView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MineFuncCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MineFuncCell" forIndexPath:indexPath];
    NSString *func = [self.dataSource objectAtIndex:indexPath.row];
    [cell updateData:func];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat w = DEVICEWIDTH/5;
    return (CGSize){w,59};
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r = self.collView.frame;
    r.origin.x = 0;
    r.origin.y = 1;
    r.size.width = self.width;
    r.size.height = self.height;
    self.collView.frame = r;
}

//功能区collectionview
- (UICollectionView*)collView{
    if (!_collView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        CGRect f = CGRectMake(0, 0, self.width, self.height);
        _collView = [[UICollectionView alloc]initWithFrame:f collectionViewLayout:layout];
        [_collView registerClass:[MineFuncCell class] forCellWithReuseIdentifier:@"MineFuncCell"];
        _collView.delegate = self;
        _collView.dataSource = self;
        _collView.backgroundColor = [UIColor whiteColor];
    }
    return _collView;
}


+ (CGFloat)calHeight{
    return 75;
}

@end
