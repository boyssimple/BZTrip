//
//  MainCollecCell.m
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "MainCollecCell.h"
@interface MainCollecCell()
@property (nonatomic, strong) UIImageView *ivImg;
@property (nonatomic, strong) UILabel *lbName;
@end
@implementation MainCollecCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _ivImg = [[UIImageView alloc]init];
        [self.contentView addSubview:_ivImg];
        
        _lbName = [[UILabel alloc]init];
        _lbName.font = [UIFont systemFontOfSize:15.5];
        _lbName.textColor = [UIColor blackColor];
        _lbName.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_lbName];
    }
    return self;
}


- (void)updateData:(MainFunc*)func{
    self.ivImg.image = [UIImage imageNamed:func.img];
    self.lbName.text = func.text;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r =  self.ivImg.frame;
    r.origin.x = 0;
    r.origin.y = 0;
    r.size.width = self.width;
    r.size.height = self.width;
    self.ivImg.frame = r;
    
    r = self.lbName.frame;
    r.origin.x = 0;
    r.origin.y = self.ivImg.top +3;
    r.size.width = self.width;
    r.size.height = 17;
    self.lbName.frame = r;
}
@end
