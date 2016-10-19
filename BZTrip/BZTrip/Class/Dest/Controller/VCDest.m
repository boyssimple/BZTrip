//
//  VCDest.m
//  BZTrip
//  目的地
//  Created by zhouMR on 16/10/9.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCDest.h"
#import "DestCollView.h"

@interface VCDest ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) UICollectionView *collView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation VCDest

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{
    [self.view addSubview:self.table];
}

- (NSArray*)dataSource{
    return @[@{@"img":@"abc",@"name":@"我的小店"},
             @{@"img":@"abc",@"name":@"我的小店"},
             @{@"img":@"abc",@"name":@"我的小店"},
             @{@"img":@"abc",@"name":@"我的小店"}];
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
    return 1;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.collView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 300;
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DestCollView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DestCollView" forIndexPath:indexPath];
    NSDictionary* data = [self.dataSource objectAtIndex:indexPath.row];
    [cell updateData:data];
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
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        CGRect f = CGRectMake(0, 0, self.table.width,100);
        _collView = [[UICollectionView alloc]initWithFrame:f collectionViewLayout:layout];
        [_collView registerClass:[DestCollView class] forCellWithReuseIdentifier:@"DestCollView"];
        _collView.delegate = self;
        _collView.dataSource = self;
        _collView.backgroundColor = [UIColor clearColor];
    }
    return _collView;
}
@end
