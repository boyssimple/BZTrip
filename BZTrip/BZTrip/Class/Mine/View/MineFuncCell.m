//
//  DestCollView.m
//  BZTrip
//
//  Created by zhouMR on 16/10/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "MineFuncCell.h"

@interface MineFuncCell()
@property (nonatomic, strong) UIImageView *ivImg;
@property (nonatomic, strong) UILabel *lbName;
@end
@implementation MineFuncCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        _ivImg = [[UIImageView alloc]init];
        [self.contentView addSubview:_ivImg];
        
        _lbName = [[UILabel alloc]init];
        _lbName.font = [UIFont systemFontOfSize:14];
        _lbName.textColor = RGB3(153);
        _lbName.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_lbName];
    }
    return self;
}


- (void)updateData:(NSDictionary*)data{
    self.ivImg.image = [UIImage imageNamed:[data objectForKey:@"img"]];
    self.lbName.text = [data objectForKey:@"name"];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r =  self.ivImg.frame;
    r.origin.x = (self.width-25)/2.0;
    r.origin.y = 10;
    r.size.width = 25;
    r.size.height = 25;
    self.ivImg.frame = r;
    
    r = self.lbName.frame;
    r.origin.x = 0;
    r.origin.y = self.ivImg.top + 10;
    r.size.width = self.width;
    r.size.height = 14;
    self.lbName.frame = r;
}

@end
