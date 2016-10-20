//
//  VCLogin.m
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCRegister.h"

@interface VCRegister()
@property (nonatomic, strong) UIButton *btnClose;
@property (nonatomic, strong) UIView *vTextBg;
@property (nonatomic, strong) UIButton *btnForgotPwd;
@property (nonatomic, strong) UIButton *btnRegister;
@end

@interface VCRegister ()

@end

@implementation VCRegister

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    self.view.backgroundColor = RGB(143, 199, 234);
}


- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)initUI{
    //关闭按钮
    [self.view addSubview:self.btnClose];
    
    [self.view addSubview:self.vTextBg];
    
    [self.view addSubview:self.btnForgotPwd];
    [self.view addSubview:self.btnRegister];
    
}

- (void)viewWillLayoutSubviews{
    CGRect r = self.btnClose.frame;
    r.origin.x = 26;
    r.origin.y = 31;
    r.size.width = 22;
    r.size.height = 22;
    self.btnClose.frame = r;
    
    r.origin.x = 25;
    r.origin.y = self.btnClose.top + 20;
    r.size.width = DEVICEWIDTH-50;
    r.size.height = 300;
    self.vTextBg.frame = r;
    
    r.origin.x = (DEVICEWIDTH - self.btnForgotPwd.titleLabel.width)/2.0;
    r.origin.y = self.vTextBg.top + 10;
    r.size.width = self.btnForgotPwd.titleLabel.width;
    r.size.height = 15;
    self.btnForgotPwd.frame = r;
    
    
    r.origin.x = self.vTextBg.x;
    r.origin.y = self.btnForgotPwd.top + 15;
    r.size.width = self.vTextBg.width;
    r.size.height = 50;
    self.btnRegister.frame = r;
}

#pragma mark - Event
- (void)closeAction:(UIButton*)sender{
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (void)forgotAction:(UIButton*)sender{
    
}

- (void)registerAction:(UIButton*)sender{
    
}



#pragma mark - Getter Setter
- (UIButton*)btnClose{
    if (!_btnClose) {
        _btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnClose setImage:[UIImage imageNamed:@"navibar_back_btn"] forState:UIControlStateNormal];
        [_btnClose addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnClose;
}

- (UIView*)vTextBg{
    if (!_vTextBg) {
        _vTextBg = [[UIView alloc]init];
        _vTextBg.layer.borderColor = RGB(20, 98, 170).CGColor;
        _vTextBg.backgroundColor = RGB(56, 136, 185);
        _vTextBg.layer.borderWidth = 1;
        _vTextBg.layer.cornerRadius = 5;
        _vTextBg.layer.masksToBounds = YES;
    }
    return _vTextBg;
}

- (UIButton*)btnForgotPwd{
    if (!_btnForgotPwd) {
        _btnForgotPwd = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnForgotPwd setTitle:@"我有注册邀请码" forState:UIControlStateNormal];
        [_btnForgotPwd addTarget:self action:@selector(forgotAction:) forControlEvents:UIControlEventTouchUpInside];
        [_btnForgotPwd.titleLabel sizeToFit];
    }
    return _btnForgotPwd;
}

- (UIButton*)btnRegister{
    if (!_btnRegister) {
        _btnRegister = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnRegister setTitle:@"注册并登录" forState:UIControlStateNormal];
        _btnRegister.backgroundColor = RGB(254, 138, 0);
        _btnRegister.layer.cornerRadius = 5;
        _btnRegister.layer.masksToBounds = YES;
        [_btnRegister addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnRegister;
}


@end
