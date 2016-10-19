//
//  DiscoverCell.m
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "DiscoverCell.h"
#import "DisPicContaier.h"
@interface DiscoverCell()
@property (nonatomic, strong) UIImageView *ivImg;
@property (nonatomic, strong) UILabel *lbAuthor;
@property (nonatomic, strong) UILabel *lbDate;
@property (nonatomic, strong) UIView *vLine;
@property (nonatomic, strong) UILabel *lbDesc;
@property (nonatomic, strong) DisPicContaier *disPicContaier;
@property (nonatomic, strong) UIView *vSeprator;
@property (nonatomic, strong) UIView *vTitleBg;
@property (nonatomic, strong) UIImageView *ivTitleImg;
@property (nonatomic, strong) UILabel *lbTitle;
@end
@implementation DiscoverCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _ivImg = [[UIImageView alloc]init];
        _ivImg.image = [UIImage imageNamed:@"abc"];
        _ivImg.layer.cornerRadius = 20;
        _ivImg.layer.masksToBounds = YES;
        [self.contentView addSubview:_ivImg];
        
        _lbAuthor = [[UILabel alloc]init];
        _lbAuthor.font = [UIFont systemFontOfSize:14];
        _lbAuthor.textColor = RGB3(52);
        [self.contentView addSubview:_lbAuthor];
        
        _lbDate = [[UILabel alloc]init];
        _lbDate.font = [UIFont systemFontOfSize:10];
        _lbDate.textColor = RGB3(102);
        [self.contentView addSubview:_lbDate];
        
        _vLine = [[UILabel alloc]init];
        _vLine.backgroundColor = RGB3(204);
        [self.contentView addSubview:_vLine];
        
        _lbDesc = [[UILabel alloc]init];
        _lbDesc.font = [UIFont systemFontOfSize:14];
        _lbDesc.textColor = RGB3(102);
        _lbDesc.numberOfLines = 0;
        [self.contentView addSubview:_lbDesc];
        
        _disPicContaier = [[DisPicContaier alloc]init];
        [self.contentView addSubview:_disPicContaier];
        
        _vSeprator = [[UILabel alloc]init];
        _vSeprator.backgroundColor = RGB3(204);
        [self.contentView addSubview:_vSeprator];
        
        _vTitleBg = [[UIView alloc]init];
        _vTitleBg.backgroundColor = RGB(249,237,213);
        [self.contentView addSubview:_vTitleBg];
        
        _ivTitleImg = [[UIImageView alloc]init];
        _ivTitleImg.image = [UIImage imageNamed:@"abc"];
        [_vTitleBg addSubview:_ivTitleImg];
        
        _lbTitle = [[UILabel alloc]init];
        _lbTitle.font = [UIFont systemFontOfSize:14];
        _lbTitle.textColor = RGB(81,81,79);
        _lbTitle.text = @"四川巴中光雾山7日游";
        [_vTitleBg addSubview:_lbTitle];
        
    }
    return self;
}

- (void)updateData{
    self.lbAuthor.text = @"小白";
    self.lbDate.text = @"2016年10月7日 17:08";
    self.lbDesc.text = @"【中国.巴中光雾山之旅】香炉山，登烽造极，下次还要去。";
    self.array = @[@"abc",@"abc",@"abc",@"abc",@"abc"];
    self.disPicContaier.imgArray = self.array;
    self.ivTitleImg.image = [UIImage imageNamed:@"abc"];
    self.lbTitle.text = @"四川巴中光雾山7日游";
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r = self.ivImg.frame;
    r.origin.x = 10;
    r.origin.y = 10;
    r.size.width = 40;
    r.size.height = 40;
    self.ivImg.frame = r;
    
    CGSize size = [self.lbAuthor sizeThatFits:CGSizeMake(MAXFLOAT, 14)];
    r.origin.x = self.ivImg.left + 10;
    r.origin.y = self.ivImg.y + 5;
    r.size.width = size.width;
    r.size.height = 14;
    self.lbAuthor.frame = r;
    
    size = [self.lbDate sizeThatFits:CGSizeMake(MAXFLOAT, 10)];
    r.origin.x = self.lbAuthor.x;
    r.origin.y = self.lbAuthor.top+3;
    r.size.width = size.width;
    r.size.height = 10;
    self.lbDate.frame = r;
    
    r.origin.x = 0;
    r.origin.y = self.ivImg.top+10;
    r.size.width = DEVICEWIDTH;
    r.size.height = 0.5;
    self.vLine.frame = r;
    
    size = [self.lbDesc sizeThatFits:CGSizeMake(DEVICEWIDTH - 20, MAXFLOAT)];
    r.origin.x = 10;
    r.origin.y = self.vLine.top + 15;
    r.size.width = DEVICEWIDTH - 20;
    r.size.height = size.height;
    self.lbDesc.frame = r;
    
    r.origin.x = 0;
    r.origin.y = self.lbDesc.top;
    r.size.width = DEVICEWIDTH;
    r.size.height = [DisPicContaier calHeight:self.array];
    self.disPicContaier.frame = r;
    
    r.origin.x = 0;
    r.origin.y = self.disPicContaier.top;
    r.size.width = DEVICEWIDTH;
    r.size.height = 40;
    self.vTitleBg.frame = r;
    
    r.origin.x = 10;
    r.origin.y = 5;
    r.size.width = 30;
    r.size.height = 30;
    self.ivTitleImg.frame = r;
    
    r.origin.x = self.ivTitleImg.left+10;
    r.origin.y = 0;
    r.size.width = DEVICEWIDTH - (self.ivTitleImg.left+10+30);
    r.size.height = self.vTitleBg.height;
    self.lbTitle.frame = r;
    
    r.origin.x = 0;
    r.origin.y = self.vTitleBg.top+50;
    r.size.width = DEVICEWIDTH;
    r.size.height = 10;
    self.vSeprator.frame = r;
}

+(CGFloat)calHeight{
    CGFloat height = 60.5+15+10+40+20 + [DisPicContaier calHeight:@[@"abc",@"abc",@"abc",@"abc",@"abc"]]+50;
    NSString *desc = @"【中国.巴中光雾山之旅】香炉山，登烽造极，下次还要去。";
    UILabel *lbDesc = [[UILabel alloc]init];
    lbDesc.font = [UIFont systemFontOfSize:14];
    lbDesc.numberOfLines = 0;
    lbDesc.text = desc;
    CGSize size = [lbDesc sizeThatFits:CGSizeMake(DEVICEWIDTH-20, MAXFLOAT)];
    height += size.height;
    
    return height;
}


@end
