//
//  VCMine.m
//  BZTrip
//
//  Created by zhouMR on 16/10/9.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCMine.h"
#import "VCLogin.h"
#import "MineHeaderView.h"
#import "CauseOrderView.h"
#import "MineMyOrderView.h"
#import "MineFuncView.h"
#import "MineElseFunc.h"

@interface VCMine ()<UITableViewDelegate,UITableViewDataSource,MineHeaderViewDelegate>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) MineHeaderView *headerView;
@property (nonatomic, strong) MineMyOrderView *orderView;
@property (nonatomic, strong) MineFuncView *funcView;
@property (nonatomic, strong) MineElseFunc *elseFuncView;
@end

@implementation VCMine

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)viewWillAppear:(BOOL)animated{
//    self.navigationController.navigationBarHidden = YES;
}

- (void)initUI{
    self.view.backgroundColor = RGB3(244);
    [self.view addSubview:self.table];
}

- (NSArray*)dataSource{
    return @[@{@"img":@"abc",@"name":@"待付款"},
             @{@"img":@"abc",@"name":@"待发货"},
             @{@"img":@"abc",@"name":@"待收货"},
             @{@"img":@"abc",@"name":@"待评价"},
             @{@"img":@"abc",@"name":@"售后/退款"}];
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
    return 4;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return self.headerView;
    }else if(section == 1){
        return self.orderView;
    }else if(section == 2){
        return self.funcView;
    }
    return self.elseFuncView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return [MineHeaderView calHeight];
    }else if(section == 1){
        return [MineMyOrderView calHeight];
    }else if(section == 2){
        return [MineFuncView calHeight];
    }
    return [MineElseFunc calHeight];
}

#pragma mark - MineHeaderViewDelegate

- (void)loginActin{
    VCLogin *vc = [[VCLogin alloc]init];
    UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nv animated:TRUE completion:nil];
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


- (MineHeaderView*)headerView{
    if (!_headerView) {
        _headerView = [[MineHeaderView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 100)];
        _headerView.delegate = self;
        [_headerView updateData];
    }
    return _headerView;
}

- (MineMyOrderView*)orderView{
    if (!_orderView) {
        _orderView = [[MineMyOrderView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 100)];
        [_orderView updateData];
    }
    return _orderView;
}

- (MineFuncView*)funcView{
    if (!_funcView) {
        _funcView = [[MineFuncView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 100)];
        _funcView.dataSource = [self.dataSource mutableCopy];
    }
    return _funcView;
}

- (MineElseFunc*)elseFuncView{
    if (!_elseFuncView) {
        _elseFuncView = [[MineElseFunc alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 100)];
    }
    return _elseFuncView;
}





@end
