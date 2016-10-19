//
//  CauseOrderView.m
//  BZTrip
//
//  Created by zhouMR on 16/10/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "CauseOrderView.h"

@interface CauseOrderView()
@property (nonatomic, strong) UILabel *lbCountTip;
@property (nonatomic, strong) UILabel *lbCount;
@property (nonatomic, strong) UILabel *lbAmountTip;
@property (nonatomic, strong) UILabel *lbAmount;
@property (nonatomic, strong) UILabel *lbDetailTip;
@property (nonatomic, strong) UILabel *lbDetail;
@property (nonatomic, strong) UIView *vLine;
@property (nonatomic, strong) UIView *vLineOne;
@property (nonatomic, strong) UIView *vLineTwo;
@end

@implementation CauseOrderView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _lbCountTip = [[UILabel alloc]init];
        _lbCountTip.font = [UIFont boldSystemFontOfSize:13];
        _lbCountTip.textColor = RGB3(82);
        _lbCountTip.text = @"订单数量";
        _lbCountTip.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbCountTip];
        
        _lbCount = [[UILabel alloc]init];
        _lbCount.font = [UIFont boldSystemFontOfSize:13];
        _lbCount.textColor = RGB(254, 72, 0);
        _lbCount.text = @"0";
        _lbCount.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbCount];
        
        _lbAmountTip = [[UILabel alloc]init];
        _lbAmountTip.font = [UIFont boldSystemFontOfSize:13];
        _lbAmountTip.textColor = RGB3(82);
        _lbAmountTip.text = @"订单金额";
        _lbAmountTip.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbAmountTip];
        
        _lbAmount = [[UILabel alloc]init];
        _lbAmount.font = [UIFont boldSystemFontOfSize:13];
        _lbAmount.textColor = RGB(254, 72, 0);
        _lbAmount.text = @"0.00";
        _lbAmount.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbAmount];
        
        _lbDetailTip = [[UILabel alloc]init];
        _lbDetailTip.font = [UIFont boldSystemFontOfSize:13];
        _lbDetailTip.textColor = RGB3(82);
        _lbDetailTip.text = @"订单详情";
        _lbDetailTip.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbDetailTip];
        
        _lbDetail = [[UILabel alloc]init];
        _lbDetail.font = [UIFont boldSystemFontOfSize:13];
        _lbDetail.textColor = RGB3(82);
        _lbDetail.text = @"点击查看";
        _lbDetail.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbDetail];
        
        
        _vLine = [[UIView alloc]init];
        _vLine.backgroundColor = RGB3(238);
        [self addSubview:_vLine];
        
        _vLineOne = [[UIView alloc]init];
        _vLineOne.backgroundColor = RGB3(238);
        [self addSubview:_vLineOne];
        
        
        _vLineTwo = [[UIView alloc]init];
        _vLineTwo.backgroundColor = RGB3(238);
        [self addSubview:_vLineTwo];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];

    CGRect r =  self.vLine.frame;
    r.origin.x = 0;
    r.origin.y = 0;
    r.size.width = self.width;
    r.size.height = 1;
    self.vLine.frame = r;
    
    CGFloat w = (self.width - 2)/3.0;
    
    r =  self.lbCountTip.frame;
    r.origin.x = 0;
    r.origin.y = self.vLine.top+15;
    r.size.width = w;
    r.size.height = 13;
    self.lbCountTip.frame = r;
    
    r =  self.lbCount.frame;
    r.origin.x = self.lbCountTip.x;
    r.origin.y = self.lbCountTip.top+15;
    r.size.width = w;
    r.size.height = self.lbCountTip.height;
    self.lbCount.frame = r;
    
    r =  self.vLineOne.frame;
    r.origin.x = self.lbCountTip.left;
    r.origin.y = self.lbCountTip.y;
    r.size.width = 1;
    r.size.height = self.lbCount.top - self.lbCountTip.y;
    self.vLineOne.frame = r;
    
    r =  self.lbAmountTip.frame;
    r.origin.x = self.vLineOne.left;
    r.origin.y = self.lbCountTip.y;
    r.size.width = w;
    r.size.height = 13;
    self.lbAmountTip.frame = r;
    
    r =  self.lbAmount.frame;
    r.origin.x = self.lbAmountTip.x;
    r.origin.y = self.lbAmountTip.top+15;
    r.size.width = w;
    r.size.height = self.lbCountTip.height;
    self.lbAmount.frame = r;
    
    r =  self.vLineTwo.frame;
    r.origin.x = self.lbAmountTip.left;
    r.origin.y = self.lbAmountTip.y;
    r.size.width = 1;
    r.size.height = self.vLineOne.height;
    self.vLineTwo.frame = r;
    
    r =  self.lbDetailTip.frame;
    r.origin.x = self.vLineTwo.left;
    r.origin.y = self.lbCountTip.y;
    r.size.width = w;
    r.size.height = 13;
    self.lbDetailTip.frame = r;
    
    r =  self.lbDetail.frame;
    r.origin.x = self.lbDetailTip.x;
    r.origin.y = self.lbDetailTip.top+15;
    r.size.width = w;
    r.size.height = self.lbCountTip.height;
    self.lbDetail.frame = r;
}

+ (CGFloat)calHeight{
    return 72;
}

@end
