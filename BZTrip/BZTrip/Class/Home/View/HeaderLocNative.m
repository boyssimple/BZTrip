//
//  HeaderLocNative.m
//  BZTrip
//
//  Created by zhouMR on 16/11/24.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "HeaderLocNative.h"
#import "CollCellHeaderLocNative.h"
@interface HeaderLocNative()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UIView *vSearch;
@property (nonatomic, strong) UIView *vSearchBg;
@property (nonatomic, strong) UIImageView *ivCover;
@property (nonatomic, strong) UICollectionView *collView;
@end
@implementation HeaderLocNative

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _vSearch = [[UIView alloc]initWithFrame:CGRectZero];
        _vSearch.backgroundColor = RGB(232, 230, 231);
        [self addSubview:_vSearch];
        
        
        _vSearchBg = [[UIView alloc]initWithFrame:CGRectZero];
        _vSearchBg.backgroundColor = [UIColor whiteColor];
        _vSearchBg.layer.cornerRadius = 3;
        [_vSearch addSubview:_vSearchBg];
        
        
        _ivCover = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:_ivCover];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collView registerClass:[CollCellHeaderLocNative class] forCellWithReuseIdentifier:@"CollCellHeaderLocNative"];
        _collView.delegate = self;
        _collView.dataSource = self;
        _collView.backgroundColor = [UIColor whiteColor];
        _collView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [self addSubview:_collView];
    
    }
    return self;
}

- (void)updateData{
    [self.ivCover downloadImage:@"http://pic.58pic.com/58pic/16/71/98/90V58PIC4iu_1024.jpg"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollCellHeaderLocNative *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollCellHeaderLocNative" forIndexPath:indexPath];
    [cell updateData];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat w = DEVICEWIDTH / 3.0;
    return CGSizeMake(w, 35);
}


- (void)layoutSubviews{
    CGRect r = self.vSearch.frame;
    r.origin.x = 0;
    r.origin.y = 0;
    r.size.width = self.width;
    r.size.height = 40;
    self.vSearch.frame = r;
    
    r = self.vSearchBg.frame;
    r.origin.x = 11;
    r.origin.y = 5;
    r.size.width = self.vSearch.width - 22;
    r.size.height = self.vSearch.height-10;
    self.vSearchBg.frame = r;
    
    r = self.ivCover.frame;
    r.origin.x = 0;
    r.origin.y = self.vSearch.top;
    r.size.width = self.width;
    r.size.height = 110*RATIO_WIDHT320;
    self.ivCover.frame = r;
    
    r = self.collView.frame;
    r.origin.x = 0;
    r.origin.y = self.ivCover.top;
    r.size.width = self.width;
    r.size.height = self.height - self.ivCover.top;
    self.collView.frame = r;
}

+ (CGFloat)calHeight:(NSArray*)arr{
    CGFloat height = 0;
    NSInteger sec = [arr count]/3;
    if ([arr count]%3 != 0) {
        sec += 1;
    }
    height = 35 * sec;
    return height+110*RATIO_WIDHT320+40;
}
@end
