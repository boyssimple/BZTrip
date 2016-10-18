//
//  MainTravelView.m
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "MainTravelView.h"

@interface MainTravelView()
@property (nonatomic, strong) UIImageView *ivImg;
@property (nonatomic, strong) UILabel *lbTitle;
@property (nonatomic, strong) UILabel *lbShareBack;
@property (nonatomic, strong) UILabel *lbShare;
@property (nonatomic, strong) UILabel *lbDesc;
@end

@implementation MainTravelView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _ivImg = [[UIImageView alloc]init];
        [self addSubview:_ivImg];
        
        _lbTitle = [[UILabel alloc]init];
        _lbTitle.font = [UIFont systemFontOfSize:20];
        _lbTitle.textColor = RGB3(51);
        _lbTitle.numberOfLines = 0;
        [self addSubview:_lbTitle];
        
        _lbShareBack = [[UILabel alloc]init];
        _lbShareBack.font = [UIFont systemFontOfSize:15];
        _lbShareBack.textColor = RGB3(153);
        _lbShareBack.numberOfLines = 0;
        [self addSubview:_lbShareBack];
        
        _lbShare = [[UILabel alloc]init];
        _lbShare.font = [UIFont systemFontOfSize:15];
        _lbShare.textColor = RGB3(153);
        _lbShare.numberOfLines = 0;
        [self addSubview:_lbShare];
        
        _lbDesc = [[UILabel alloc]init];
        _lbDesc.font = [UIFont systemFontOfSize:15];
        _lbDesc.textColor = RGB3(153);
        _lbDesc.numberOfLines = 0;
        [self addSubview:_lbDesc];
    }
    return self;
}


- (void)updateData:(MainTravel*)travel{
    self.ivImg.image = [UIImage imageNamed:travel.img];
    self.lbTitle.text = travel.title;
    self.lbShareBack.text = [NSString stringWithFormat:@"分享回报：%@元",travel.shareBack];
    self.lbShare.text = [NSString stringWithFormat:@"%zi 人分享",travel.shareCount];
    self.lbDesc.text = travel.desc;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r = self.ivImg.frame;
    r.origin.x = 10;
    r.origin.y = 5;
    r.size.width = self.width - 20;
    r.size.height = 100*RATIO_WIDHT320;
    self.ivImg.frame = r;
    
    CGSize size = [self.lbTitle sizeThatFits:CGSizeMake(DEVICEWIDTH-50, MAXFLOAT)];
    r = self.lbTitle.frame;
    r.origin.x = 25;
    r.origin.y = self.ivImg.top+20;
    r.size.width = DEVICEWIDTH-50;
    r.size.height = size.height;
    self.lbTitle.frame = r;
    
    size = [self.lbShareBack sizeThatFits:CGSizeMake(MAXFLOAT, 15)];
    r = self.lbShareBack.frame;
    r.origin.x = self.lbTitle.x;
    r.origin.y = self.lbTitle.top+15;
    r.size.width = size.width;
    r.size.height = 15;
    self.lbShareBack.frame = r;
    
    size = [self.lbShare sizeThatFits:CGSizeMake(MAXFLOAT, 15)];
    r = self.lbShare.frame;
    r.origin.x = DEVICEWIDTH - size.width - self.lbTitle.x;
    r.origin.y = self.lbShareBack.y;
    r.size.width = size.width;
    r.size.height = 15;
    self.lbShare.frame = r;
    
    size = [self.lbDesc sizeThatFits:CGSizeMake(DEVICEWIDTH-self.lbTitle.x*2, MAXFLOAT)];
    r = self.lbDesc.frame;
    r.origin.x = self.lbTitle.x;
    r.origin.y = self.lbShareBack.top+10;
    r.size.width = DEVICEWIDTH - self.lbTitle.x*2;
    r.size.height = size.height;
    self.lbDesc.frame = r;
}

+ (CGFloat)calHeight:(MainTravel*)travel{
    
    CGFloat height = 100*RATIO_WIDHT320+25 + 30 + 20;
    
    UILabel *lbTitle = [[UILabel alloc]init];
    lbTitle.font = [UIFont systemFontOfSize:20];
    lbTitle.numberOfLines = 0;
    lbTitle.text = travel.title;
    CGSize size = [lbTitle sizeThatFits:CGSizeMake(DEVICEWIDTH-50, MAXFLOAT)];
    height += size.height;
    
    UILabel *lbDesc = [[UILabel alloc]init];
    lbDesc.font = [UIFont systemFontOfSize:15];
    lbDesc.numberOfLines = 0;
    lbDesc.text = travel.desc;
    size = [lbDesc sizeThatFits:CGSizeMake(DEVICEWIDTH-50, MAXFLOAT)];
    height += size.height;

    return height;
}
@end
