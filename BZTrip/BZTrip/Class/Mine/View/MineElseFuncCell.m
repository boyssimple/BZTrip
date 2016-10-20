//
//  MineElseFuncCell.m
//  BZTrip
//
//  Created by zhouMR on 16/10/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "MineElseFuncCell.h"
@interface MineElseFuncCell()

@property (nonatomic, strong) UIImageView *ivImg;
@property (nonatomic, strong) UILabel *lbName;
@property (nonatomic, strong) UIView *vLine;
@end

@implementation MineElseFuncCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _ivImg = [[UIImageView alloc]init];
        _ivImg.layer.cornerRadius = 15;
        _ivImg.layer.masksToBounds = YES;
        [self.contentView addSubview:_ivImg];
        
        _lbName = [[UILabel alloc]init];
        _lbName.font = [UIFont systemFontOfSize:14];
        _lbName.textColor = RGB3(153);
        [self.contentView addSubview:_lbName];
        
        _vLine = [[UIView alloc]init];
        _vLine.backgroundColor = RGB3(244);
        [self.contentView addSubview:_vLine];
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
    r.origin.x = 10;
    r.origin.y = 15;
    r.size.width = 30;
    r.size.height = 30;
    self.ivImg.frame = r;
    
    r.origin.x = self.ivImg.left + 10;
    r.origin.y = (self.height - 14)/2.0;
    r.size.width = 100;
    r.size.height = 14;
    self.lbName.frame = r;
    
    r.origin.x = 0;
    r.origin.y = self.ivImg.top + 14;
    r.size.width = DEVICEWIDTH;
    r.size.height = 1;
    self.vLine.frame = r;
}

+ (CGFloat)calHeight{
    return 60;
}
@end
