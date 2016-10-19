//
//  DisPicContaier.m
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "DisPicContaier.h"
#import "DisPicCell.h"

#define IMG_WIDTH 100
@interface DisPicContaier()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collView;
@end
@implementation DisPicContaier

- (instancetype)init{
    self = [super init];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGRect f = CGRectMake(0, 0, self.width, self.height);
        _collView = [[UICollectionView alloc]initWithFrame:f collectionViewLayout:layout];
        [_collView registerClass:[DisPicCell class] forCellWithReuseIdentifier:@"DisPicCell"];
        _collView.dataSource = self;
        _collView.delegate = self;
        _collView.backgroundColor = [UIColor clearColor];
        _collView.scrollEnabled = NO;
        [self addSubview:_collView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r = self.collView.frame;
    r.size.width = self.width;
    r.size.height = self.height;
    self.collView.frame = r;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imgArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DisPicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DisPicCell" forIndexPath:indexPath];
    NSString *img = [self.imgArray objectAtIndex:indexPath.row];
    [cell updateData:img];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count = DEVICEWIDTH / IMG_WIDTH;
    CGFloat w = (DEVICEWIDTH - (count+1)*10)/count;
    return (CGSize){w,w};
}

- (void)setImgArray:(NSArray *)imgArray{
    _imgArray = imgArray;
    [self.collView reloadData];
}

+(CGFloat)calHeight:(NSArray*)imgArray{
    CGFloat height = 20;
    NSInteger count = DEVICEWIDTH / IMG_WIDTH;
    CGFloat w = (DEVICEWIDTH - (count+1)*10)/count;
    NSInteger col = imgArray.count / count;
    height += w * (col+1) + col * 10;
    return height;
}
@end
