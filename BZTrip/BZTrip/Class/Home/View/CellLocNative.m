//
//  CellLocNative.m
//  BZTrip
//
//  Created by zhouMR on 16/11/24.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "CellLocNative.h"
#import "CollCellLocNative.h"
@interface CellLocNative()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collView;
@end

@implementation CellLocNative


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 8.5;
        layout.minimumInteritemSpacing = 9;
        _collView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collView registerClass:[CollCellLocNative class] forCellWithReuseIdentifier:@"CollCellLocNative"];
        _collView.delegate = self;
        _collView.dataSource = self;
        _collView.backgroundColor = [UIColor whiteColor];
        _collView.contentInset = UIEdgeInsetsMake(8.5, 11, 8.5, 11);
        [self.contentView addSubview:_collView];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollCellLocNative *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollCellLocNative" forIndexPath:indexPath];
    [cell updateData];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat w = (DEVICEWIDTH-31)/2.0;
    return CGSizeMake(w, [CollCellLocNative calHeight]);
}

- (void)layoutSubviews{
    CGRect r = self.collView.frame;
    r.origin.x = 0;
    r.origin.y = 0;
    r.size.width = self.width;
    r.size.height = self.height;
    self.collView.frame = r;
}

+ (CGFloat)calHeight:(NSArray*)arr{
    CGFloat height = 0;
    NSInteger sec = [arr count]/2;
    if ([arr count]%2 != 0) {
        sec += 1;
    }
    height = [CollCellLocNative calHeight] * sec + (sec - 1) * 8.5;
    return height+17;
}
@end
