//
//  CollCellLocNative.m
//  BZTrip
//
//  Created by zhouMR on 16/11/24.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "CollCellLocNative.h"

@interface CollCellLocNative()
@property (nonatomic, strong) UIImageView *ivCover;
@property (nonatomic, strong) UIView *vTopBg;
@property (nonatomic, strong) UIImageView *ivImg;
@property (nonatomic, strong) UILabel *lbName;
@property (nonatomic, strong) UILabel *lbFrom;
@property (nonatomic, strong) UILabel *lbAddress;
@property (nonatomic, strong) UIView *vBottomBg;
@property (nonatomic, strong) UILabel *lbText;
@property (nonatomic, strong) UILabel *lbPrice;
@property (nonatomic, strong) UILabel *lbUnit;
@property (nonatomic, strong) UILabel *lbShareBack;
@property (nonatomic, strong) UILabel *lbShareCount;
@end

@implementation CollCellLocNative
- (instancetype)initWithFrame:(CGRect)frame{
    self  = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.borderWidth = 0.5;
        self.contentView.layer.borderColor = RGB3(207).CGColor;
        
        _ivCover = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_ivCover];
        
        _vTopBg = [[UIView alloc]initWithFrame:CGRectZero];
        _vTopBg.backgroundColor = RGB(253, 252, 221);
        [self.contentView addSubview:_vTopBg];
        
        _ivImg = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivImg.layer.cornerRadius = 25.f;
        _ivImg.layer.masksToBounds = YES;
        [_vTopBg addSubview:_ivImg];
        
        _lbName = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbName.font = [UIFont systemFontOfSize:14];
        _lbName.textColor = RGB(52, 52, 50);
        [_vTopBg addSubview:_lbName];
        
        _lbFrom = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbFrom.font = [UIFont systemFontOfSize:10];
        _lbFrom.textColor = RGB3(153);
        _lbFrom.text = @"来自：";
        [_vTopBg addSubview:_lbFrom];
        
        _lbAddress = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbAddress.font = [UIFont systemFontOfSize:10];
        _lbAddress.textColor = _lbFrom.textColor;
        [_vTopBg addSubview:_lbAddress];
        
        
        _vBottomBg = [[UIView alloc]initWithFrame:CGRectZero];
        _vBottomBg.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_vBottomBg];
        
        
        _lbText = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbText.font = [UIFont systemFontOfSize:14];
        _lbText.textColor = RGB3(51);
        [_vBottomBg addSubview:_lbText];
        
        _lbPrice = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbPrice.font = [UIFont systemFontOfSize:17];
        _lbPrice.textColor = RGB(255,102,1);
        [_vBottomBg addSubview:_lbPrice];
        
        _lbUnit = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbUnit.font = [UIFont systemFontOfSize:10];
        _lbUnit.textColor = RGB(255,102,1);
        [_vBottomBg addSubview:_lbUnit];
        
        _lbShareBack = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbShareBack.font = [UIFont systemFontOfSize:10];
        _lbShareBack.textColor = RGB3(152);
        [_vBottomBg addSubview:_lbShareBack];
        
        _lbShareCount = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbShareCount.font = [UIFont systemFontOfSize:10];
        _lbShareCount.textColor = self.lbShareBack.textColor;
        [_vBottomBg addSubview:_lbShareCount];
    }
    return self;
}

- (void)updateData{
    [self.ivCover downloadImage:@"http://g.hiphotos.baidu.com/image/pic/item/83025aafa40f4bfb1530a905014f78f0f63618fa.jpg"];
    [self.ivImg downloadImage:@"http://g.hiphotos.baidu.com/image/pic/item/83025aafa40f4bfb1530a905014f78f0f63618fa.jpg"];
    self.lbName.text = @"一呜";
    self.lbAddress.text = @"四川巴中";
    self.lbText.text = @"最地道的巴中灯影牛肉干";
    self.lbPrice.text = @"￥98";
    self.lbUnit.text = @"/1kg";
    self.lbShareBack.text = @"分享回报￥2.5";
    self.lbShareCount.text = @"998人分享";
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r = self.ivCover.frame;
    r.origin.x = 0;
    r.origin.y = 0;
    r.size.width = self.width;
    r.size.height = 127.5*RATIO_WIDHT320;
    self.ivCover.frame = r;
    
    r = self.vTopBg.frame;
    r.origin.x = 0;
    r.origin.y = self.ivCover.top;
    r.size.width = self.width;
    r.size.height = 70;
    self.vTopBg.frame = r;
    
    r = self.ivImg.frame;
    r.origin.x = 5;
    r.origin.y = 10;
    r.size.width = 50;
    r.size.height = r.size.width;
    self.ivImg.frame = r;
    
    CGSize size = [self.lbName sizeThatFits:CGSizeMake(MAXFLOAT, 14)];
    r = self.lbName.frame;
    r.origin.x = self.ivImg.left+5;
    r.origin.y = self.ivImg.y+10;
    r.size.width = size.width;
    r.size.height = 14;
    self.lbName.frame = r;
    
    size = [self.lbFrom sizeThatFits:CGSizeMake(MAXFLOAT, 10)];
    r = self.lbFrom.frame;
    r.origin.x = self.lbName.x;
    r.origin.y = self.lbName.top+10;
    r.size.width = size.width;
    r.size.height = 10;
    self.lbFrom.frame = r;
    
    size = [self.lbAddress sizeThatFits:CGSizeMake(MAXFLOAT, 10)];
    r = self.lbAddress.frame;
    r.origin.x = self.lbFrom.left;
    r.origin.y = self.lbFrom.y;
    r.size.width = size.width;
    r.size.height = 10;
    self.lbAddress.frame = r;
    
    r = self.vBottomBg.frame;
    r.origin.x = 0;
    r.origin.y = self.vTopBg.top;
    r.size.width = self.width;
    r.size.height = 100;
    self.vBottomBg.frame = r;
    
    size = [self.lbText sizeThatFits:CGSizeMake(MAXFLOAT, 14)];
    r = self.lbText.frame;
    r.origin.x = 10;
    r.origin.y = 10;
    r.size.width = size.width;
    r.size.height = 14;
    self.lbText.frame = r;
    
    size = [self.lbPrice sizeThatFits:CGSizeMake(MAXFLOAT, 17)];
    r = self.lbPrice.frame;
    r.origin.x = 10;
    r.origin.y = self.lbText.top+15;
    r.size.width = size.width;
    r.size.height = 17;
    self.lbPrice.frame = r;
    
    size = [self.lbUnit sizeThatFits:CGSizeMake(MAXFLOAT, 13)];
    r = self.lbUnit.frame;
    r.origin.x = self.lbPrice.left;
    r.origin.y = self.lbPrice.y+5;
    r.size.width = size.width;
    r.size.height = 13;
    self.lbUnit.frame = r;
    
    size = [self.lbShareBack sizeThatFits:CGSizeMake(MAXFLOAT, 10)];
    r = self.lbShareBack.frame;
    r.origin.x = 5;
    r.origin.y = self.lbPrice.top+20;
    r.size.width = size.width;
    r.size.height = 10;
    self.lbShareBack.frame = r;
    
    size = [self.lbShareCount sizeThatFits:CGSizeMake(MAXFLOAT, 10)];
    r = self.lbShareCount.frame;
    r.origin.x = self.vBottomBg.width - size.width - 5;
    r.origin.y = self.lbShareBack.y;
    r.size.width = size.width;
    r.size.height = 10;
    self.lbShareCount.frame = r;
}

+ (CGFloat)calHeight{
    return 127.5*RATIO_WIDHT320+170;
}


@end
