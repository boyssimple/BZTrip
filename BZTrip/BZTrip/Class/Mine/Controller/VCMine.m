//
//  VCMine.m
//  BZTrip
//
//  Created by zhouMR on 16/10/9.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCMine.h"
#import "CauseCollView.h"
#import "MineHeaderView.h"
#import "CauseOrderView.h"

@interface VCMine ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) UICollectionView *collView;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) MineHeaderView *headerView;
@property (nonatomic, strong) CauseOrderView *causeOrderView;
@end

@implementation VCMine

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{
    self.view.backgroundColor = RGB3(238);
    [self.view addSubview:self.table];
}

- (NSArray*)dataSource{
    return @[@{@"img":@"abc",@"name":@"我的小店"},
             @{@"img":@"abc",@"name":@"我的团队"},
             @{@"img":@"abc",@"name":@"邀请成员"},
             @{@"img":@"abc",@"name":@"我的助手"},
             @{@"img":@"abc",@"name":@"掌柜课堂"}];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return self.headerView;
    }else if(section == 1){
        return self.causeOrderView;
    }
    return self.collView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return [MineHeaderView calHeight];
    }else if(section == 1){
        return [CauseOrderView calHeight];
    }
    return self.collView.height;
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count+1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CauseCollView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CauseCollView" forIndexPath:indexPath];
    if (indexPath.row <= self.dataSource.count-1) {
        
        NSDictionary* data = [self.dataSource objectAtIndex:indexPath.row];
        [cell updateData:data];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat mw = 2;
    CGFloat w = (DEVICEWIDTH - mw)/3;
    return (CGSize){w,w};
}


#pragma mark - Getter Setter

- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHEIGHT)];
        _table.delegate = self;
        _table.dataSource = self;
        _table.backgroundColor = [UIColor clearColor];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _table;
}


//功能区collectionview
- (UICollectionView*)collView{
    if (!_collView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
        
        
        CGFloat mw = 2;
        CGFloat w = (DEVICEWIDTH - mw)/3;
        
        CGRect f = CGRectMake(0, 0, self.table.width,w*2+11);
        _collView = [[UICollectionView alloc]initWithFrame:f collectionViewLayout:layout];
        [_collView registerClass:[CauseCollView class] forCellWithReuseIdentifier:@"CauseCollView"];
        _collView.delegate = self;
        _collView.dataSource = self;
        _collView.backgroundColor = [UIColor clearColor];
    }
    return _collView;
}

- (MineHeaderView*)headerView{
    if (!_headerView) {
        _headerView = [[MineHeaderView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 100)];
        [_headerView updateData];
    }
    return _headerView;
}

- (CauseOrderView*)causeOrderView{
    if (!_causeOrderView) {
        _causeOrderView = [[CauseOrderView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 100)];
    }
    return _causeOrderView;
}


@end
