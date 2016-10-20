//
//  VCDiscover.m
//  BZTrip
//
//  Created by zhouMR on 16/10/9.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCDiscover.h"
#import "DiscoverCell.h"
#import "VCPublishDiscover.h"

@interface VCDiscover ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@end

@implementation VCDiscover

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{
    UIImage* imageN = [UIImage imageNamed:@"discover_publish_btn"];
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, imageN.size.width , imageN.size.height )];
    [button setImage:imageN forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actionNavBar) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];;
    [self.view addSubview:self.table];
}

- (void)actionNavBar{
    VCPublishDiscover *vc = [[VCPublishDiscover alloc]init];
    vc.hidesBottomBarWhenPushed = TRUE;
    [self.navigationController pushViewController:vc animated:TRUE];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  [DiscoverCell calHeight];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"DiscoverCell";
    DiscoverCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[DiscoverCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell updateData];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHEIGHT)];
        _table.delegate = self;
        _table.dataSource = self;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _table;
}

@end
