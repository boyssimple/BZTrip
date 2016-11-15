//
//  MineElseFunc.m
//  BZTrip
//
//  Created by zhouMR on 16/10/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "MineElseFunc.h"
#import "MineElseFuncCell.h"

@interface MineElseFunc()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@end

@implementation MineElseFunc

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.table];
    }
    return self;
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [MineElseFuncCell calHeight];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"MineElseFuncCell";
    MineElseFuncCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MineElseFuncCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell updateData:@{@"img":@"abc",@"name":@"我的消息"}];
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Header"];
    if (!header) {
        header = [[UIView alloc]init];
        header.backgroundColor = [UIColor clearColor];
    }
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}


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

+ (CGFloat)calHeight{
    return 270;
}

@end
