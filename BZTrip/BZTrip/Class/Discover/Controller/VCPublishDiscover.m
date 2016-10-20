//
//  VCPublishDiscover.m
//  BZTrip
//
//  Created by zhouMR on 16/10/20.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCPublishDiscover.h"
#import "DisPublishCell.h"

@interface VCPublishDiscover ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collView;
@property (nonatomic, strong) UITextView *tvView;
@property (nonatomic, strong) UIButton *btnAdd;
@property (nonatomic, strong) UIButton *btnPublish;
@end

@implementation VCPublishDiscover

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{
    [self.view addSubview:self.collView];
    [self.view addSubview:self.tvView];
    [self.view addSubview:self.btnAdd];
    [self.view addSubview:self.btnPublish];
    [self.collView reloadData];
}

- (NSArray*)dataSource{
    return @[@"abc",@"abc",@"abc",@"abc",@"abc",@"abc",@"DIS_ADD"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DisPublishCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DisPublishCell" forIndexPath:indexPath];
    NSString *func = [self.dataSource objectAtIndex:indexPath.row];
    [cell updateData:func];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat w = (DEVICEWIDTH - 70)/4;
    return (CGSize){w,w};
}

//功能区collectionview
- (UICollectionView*)collView{
    if (!_collView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(15, 20, 15, 20);
        CGRect f = CGRectMake(0, NAV_STATUS_HEIGHT, DEVICEWIDTH, 100);
        _collView = [[UICollectionView alloc]initWithFrame:f collectionViewLayout:layout];
        [_collView registerClass:[DisPublishCell class] forCellWithReuseIdentifier:@"DisPublishCell"];
        _collView.delegate = self;
        _collView.dataSource = self;
        _collView.contentInset = UIEdgeInsetsMake(-NAV_STATUS_HEIGHT, 0, 0, 0);
        _collView.scrollEnabled = NO;
        _collView.backgroundColor = [UIColor clearColor];
    }
    return _collView;
}

- (UITextView*)tvView{
    if (!_tvView) {
        _tvView = [[UITextView alloc]init];
        _tvView.backgroundColor = RGB3(238);
        _tvView.layer.cornerRadius = 5;
        _tvView.layer.masksToBounds = YES;
    }
    return _tvView;
}

- (UIButton*)btnAdd{
    if(!_btnAdd){
        _btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnAdd setTitle:@"添加关联的商品(选填)" forState:UIControlStateNormal];
        _btnAdd.titleLabel.font = [UIFont systemFontOfSize:14];
        [_btnAdd setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _btnAdd.layer.borderColor = [UIColor grayColor].CGColor;
        _btnAdd.layer.borderWidth = 1;
        _btnAdd.layer.cornerRadius = 5;
        _btnAdd.layer.masksToBounds = YES;
        
    }
    return _btnAdd;
}


- (UIButton*)btnPublish{
    if(!_btnPublish){
        _btnPublish = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnPublish setTitle:@"发布" forState:UIControlStateNormal];
        _btnPublish.titleLabel.font = [UIFont systemFontOfSize:14];
        _btnPublish.backgroundColor = BASE_COLOR;
        [_btnPublish setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btnPublish.layer.cornerRadius = 5;
        _btnPublish.layer.masksToBounds = YES;
    }
    return _btnPublish;
}

- (void)viewWillLayoutSubviews{
    CGRect r = self.collView.frame;
    
    CGFloat w = (DEVICEWIDTH - 70)/4;
    NSInteger count = self.dataSource.count;
    NSInteger col = count / 4;
    if (count % 4  != 0) {
        col += 1;
    }
    CGFloat h = w * col  + 30 +(col-1)*10;
    r.origin.x = 0;
    r.origin.y = NAV_STATUS_HEIGHT;
    r.size.width = DEVICEWIDTH;
    r.size.height = h;
    self.collView.frame = r;
    
    r.origin.x = 20;
    r.origin.y = self.collView.top + 15;
    r.size.width = DEVICEWIDTH-40;
    r.size.height = 130;
    self.tvView.frame = r;
    
    r.origin.x = self.tvView.x;
    r.origin.y = self.tvView.top+15;
    r.size.width = self.tvView.width;
    r.size.height = 50;
    self.btnAdd.frame = r;
    
    r.origin.x = self.tvView.x;
    r.origin.y = self.btnAdd.top+15;;
    r.size.width = self.tvView.width;
    r.size.height = 40;
    self.btnPublish.frame = r;
}
@end
