//
//  VCMine.m
//  BZTrip
//
//  Created by zhouMR on 16/10/9.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCMine.h"
#import "VCLogin.h"

@interface VCMine ()
@property (nonatomic, strong) UIButton *btnLogin;

@end

@implementation VCMine

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.btnLogin];
}

#pragma mark - Event
- (void)loginAction:(UIButton*)sender{
    VCLogin *vc = [[VCLogin alloc]init];
    [self presentViewController:vc animated:TRUE completion:nil];
}

#pragma mark - Getter Setter
- (UIButton*)btnLogin{
    if (!_btnLogin) {
        _btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnLogin.frame = CGRectMake(100, 100, 100, 30);
        _btnLogin.backgroundColor = [UIColor blueColor];
        [_btnLogin addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnLogin;
}

@end
