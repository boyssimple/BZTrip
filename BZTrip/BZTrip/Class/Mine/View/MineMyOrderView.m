//
//  MineMyOrderView.m
//  BZTrip
//
//  Created by zhouMR on 16/10/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "MineMyOrderView.h"

@interface MineMyOrderView()
@property (nonatomic, strong) UIImageView *ivImg;
@property (nonatomic, strong) UILabel *lbName;
@property (nonatomic, strong) UIButton *btnShowAll;
@end
@implementation MineMyOrderView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _ivImg = [[UIImageView alloc]init];
        _ivImg.layer.cornerRadius = 15;
        _ivImg.layer.masksToBounds = YES;
        [self addSubview:_ivImg];
        
        _lbName = [[UILabel alloc]init];
        _lbName.font = [UIFont systemFontOfSize:14];
        _lbName.textColor = RGB3(102);
        _lbName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbName];
        
        _btnShowAll = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnShowAll setTitle:@"查看全部订单" forState:UIControlStateNormal];
        [_btnShowAll.titleLabel sizeToFit];
        [_btnShowAll setTitleColor:RGB3(102) forState:UIControlStateNormal];
        _btnShowAll.titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_btnShowAll];
    }
    return self;
}

- (void)updateData{
    self.ivImg.image = [UIImage imageNamed:@"abc"];
    self.lbName.text = @"我买入的订单";
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r =  self.ivImg.frame;
    r.origin.x = 10;
    r.origin.y = 20;
    r.size.width = 30;
    r.size.height = 30;
    self.ivImg.frame = r;
    
    CGSize size = [self.lbName sizeThatFits:CGSizeMake(MAXFLOAT, 14)];
    r.origin.x = self.ivImg.left + 10;
    r.origin.y = (self.height-14)/2.0;
    r.size.width = size.width;
    r.size.height = 14;
    self.lbName.frame = r;
    
    CGFloat w = self.btnShowAll.titleLabel.width;
    r.origin.x = self.width - 20-w;
    r.origin.y = (self.height-40)/2.0;
    r.size.width = w;
    r.size.height = 40;
    self.btnShowAll.frame = r;
}


+ (CGFloat)calHeight{
    return 70;
}
@end
