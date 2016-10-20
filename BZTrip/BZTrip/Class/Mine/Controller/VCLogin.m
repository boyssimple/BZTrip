//
//  VCLogin.m
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCLogin.h"
#import "VCRegister.h"


@interface VCLogin()
@property (nonatomic, strong) UIButton *btnClose;
@property (nonatomic, strong) UILabel *lbLogin;
@property (nonatomic, strong) UIView *vSwitchBg;
@property (nonatomic, strong) UIButton *btnAcountLogin;
@property (nonatomic, strong) UIButton *btnDynamicPwd;
@property (nonatomic, strong) UIView *vTextBg;
@property (nonatomic, strong) UIButton *btnForgotPwd;
@property (nonatomic, strong) UIButton *btnLogin;
@property (nonatomic, strong) UIButton *btnRegister;
@property (nonatomic, strong) UIView *vLeftLine;
@property (nonatomic, strong) UIView *vRightLine;
@property (nonatomic, strong) UILabel *lbVendorInfo;


@property (nonatomic, strong) UIButton *btnQQ;
@property (nonatomic, strong) UIButton *btnWeiXin;
@property (nonatomic, strong) UIButton *btnWeibo;
@end

@interface VCLogin ()

@end

@implementation VCLogin

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
    
    [self.view addSubview:self.lbLogin];
    
    [self.view addSubview:self.vSwitchBg];
    
    [self.view addSubview:self.vTextBg];
    
    [self.view addSubview:self.btnForgotPwd];
    [self.view addSubview:self.btnLogin];
    [self.view addSubview:self.btnRegister];
    
    [self.view addSubview:self.vLeftLine];
    [self.view addSubview:self.vRightLine];
    [self.view addSubview:self.lbVendorInfo];
    
    
    [self.view addSubview:self.btnQQ];
    [self.view addSubview:self.btnWeiXin];
    [self.view addSubview:self.btnWeibo];
}

- (void)viewWillLayoutSubviews{
    CGRect r = self.btnClose.frame;
    r.origin.x = 30;
    r.origin.y = 35;
    r.size.width = 18;
    r.size.height = 18;
    self.btnClose.frame = r;
    
    r.origin.x = (DEVICEWIDTH-100)/2.0;
    r.origin.y = self.btnClose.top + 20;
    r.size.width = 100;
    r.size.height = 30;
    self.lbLogin.frame = r;
    
    r.origin.x = 25;
    r.origin.y = self.lbLogin.top + 30;
    r.size.width = DEVICEWIDTH-50;
    r.size.height = 50;
    self.vSwitchBg.frame = r;
    
    r.origin.x = 0;
    r.origin.y = 0;
    r.size.width = self.vSwitchBg.width/2.0;
    r.size.height = self.vSwitchBg.height;
    self.btnAcountLogin.frame = r;
    
    r.origin.x = self.btnAcountLogin.left;
    r.origin.y = 0;
    r.size.width = self.btnAcountLogin.width;
    r.size.height = self.btnAcountLogin.height;
    self.btnDynamicPwd.frame = r;
    
    r.origin.x = self.vSwitchBg.x;
    r.origin.y = self.vSwitchBg.top + 40;
    r.size.width = self.vSwitchBg.width;
    r.size.height = 100;
    self.vTextBg.frame = r;
    
    r.origin.x = DEVICEWIDTH - self.btnForgotPwd.titleLabel.width - self.vTextBg.x;
    r.origin.y = self.vTextBg.top + 10;
    r.size.width = self.btnForgotPwd.titleLabel.width;
    r.size.height = 15;
    self.btnForgotPwd.frame = r;
    
    r = self.btnLogin.frame;
    r.origin.x = self.vTextBg.x;
    r.origin.y = self.btnForgotPwd.top + 15;
    r.size.width = self.vTextBg.width;
    r.size.height = 50;
    self.btnLogin.frame = r;
    
    r.origin.x = self.vTextBg.x;
    r.origin.y = self.btnLogin.top + 15;
    r.size.width = self.vTextBg.width;
    r.size.height = 50;
    self.btnRegister.frame = r;
    
    CGSize size = [self.lbVendorInfo sizeThatFits:CGSizeMake(MAXFLOAT, 12)];
    r.origin.x = (DEVICEWIDTH - size.width)/2.0;
    r.origin.y = self.btnRegister.top + 15;
    r.size.width = size.width;
    r.size.height = 12;
    self.lbVendorInfo.frame = r;
    
    r.origin.x = 0;
    r.origin.y = self.lbVendorInfo.y + (self.lbVendorInfo.height-1)/2.0;
    r.size.width = self.lbVendorInfo.x - 5;
    r.size.height = 1;
    self.vLeftLine.frame = r;
    
    r.origin.x = self.lbVendorInfo.left + 5;
    r.origin.y = self.vLeftLine.y;
    r.size.width = self.vLeftLine.width;
    r.size.height = 1;
    self.vRightLine.frame = r;
    
    r.origin.x = (DEVICEWIDTH - (60+60*3))/2.0;
    r.origin.y = self.lbVendorInfo.top + 20;
    r.size.width = 60;
    r.size.height = 60;
    self.btnQQ.frame = r;
    
    r.origin.x = self.btnQQ.left + 30;
    r.origin.y = self.btnQQ.y;
    r.size.width = self.btnQQ.width;
    r.size.height = self.btnQQ.width;
    self.btnWeiXin.frame = r;
    
    r.origin.x = self.btnWeiXin.left + 30;
    r.origin.y = self.btnQQ.y;
    r.size.width = self.btnQQ.width;
    r.size.height = self.btnQQ.width;
    self.btnWeibo.frame = r;
}

#pragma mark - Event
- (void)closeAction:(UIButton*)sender{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (void)accountAction:(UIButton*)sender{
    self.btnDynamicPwd.backgroundColor = [UIColor clearColor];
    sender.backgroundColor = RGB(20, 96, 171);
}

- (void)dynamicAction:(UIButton*)sender{
    self.btnAcountLogin.backgroundColor = [UIColor clearColor];
    sender.backgroundColor = RGB(20, 96, 171);
}

- (void)forgotAction:(UIButton*)sender{
    
}

- (void)loginAction:(UIButton*)sender{
    
}

- (void)registerAction:(UIButton*)sender{
    VCRegister *vc = [[VCRegister alloc]init];
    [self.navigationController pushViewController:vc animated:TRUE];
}

- (void)qqAction:(UIButton*)sender{
    
}

- (void)wechatAction:(UIButton*)sender{
    
}

- (void)weiboAction:(UIButton*)sender{
    
}



#pragma mark - Getter Setter
- (UIButton*)btnClose{
    if (!_btnClose) {
        _btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnClose setImage:[UIImage imageNamed:@"close_preview"] forState:UIControlStateNormal];
        [_btnClose addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnClose;
}

- (UILabel*)lbLogin{
    if (!_lbLogin) {
        _lbLogin = [[UILabel alloc]init];
        _lbLogin.font = [UIFont systemFontOfSize:20];
        _lbLogin.textColor = [UIColor whiteColor];
        _lbLogin.text = @"登录";
        _lbLogin.textAlignment = NSTextAlignmentCenter;
    }
    return _lbLogin;
}

- (UIView*)vSwitchBg{
    if (!_vSwitchBg) {
        _vSwitchBg = [[UIView alloc]init];
        _vSwitchBg.layer.borderColor = RGB(20, 96, 171).CGColor;
        _vSwitchBg.layer.borderWidth = 2;
        _vSwitchBg.layer.cornerRadius = 5;
        _vSwitchBg.layer.masksToBounds = YES;
        [_vSwitchBg addSubview:self.btnAcountLogin];
        [_vSwitchBg addSubview:self.btnDynamicPwd];
    }
    return _vSwitchBg;
}

- (UIButton*)btnAcountLogin{
    if (!_btnAcountLogin) {
        _btnAcountLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnAcountLogin setTitle:@"帐号登录" forState:UIControlStateNormal];
        _btnAcountLogin.backgroundColor = RGB(20, 96, 171);
        [_btnAcountLogin addTarget:self action:@selector(accountAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnAcountLogin;
}

- (UIButton*)btnDynamicPwd{
    if (!_btnDynamicPwd) {
        _btnDynamicPwd = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnDynamicPwd setTitle:@"动态密码" forState:UIControlStateNormal];
        [_btnDynamicPwd addTarget:self action:@selector(dynamicAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnDynamicPwd;
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
        [_btnForgotPwd setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [_btnForgotPwd addTarget:self action:@selector(forgotAction:) forControlEvents:UIControlEventTouchUpInside];
        [_btnForgotPwd.titleLabel sizeToFit];
    }
    return _btnForgotPwd;
}

- (UIButton*)btnLogin{
    if (!_btnLogin) {
        _btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnLogin setTitle:@"登录" forState:UIControlStateNormal];
        _btnLogin.backgroundColor = RGB(20, 96, 171);
        _btnLogin.layer.cornerRadius = 5;
        _btnLogin.layer.masksToBounds = YES;
        [_btnLogin addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnLogin;
}


- (UIButton*)btnRegister{
    if (!_btnRegister) {
        _btnRegister = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnRegister setTitle:@"注册新用户" forState:UIControlStateNormal];
        _btnRegister.backgroundColor = RGB(254, 138, 0);
        _btnRegister.layer.cornerRadius = 5;
        _btnRegister.layer.masksToBounds = YES;
        [_btnRegister addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnRegister;
}


- (UIView*)vLeftLine{
    if (!_vLeftLine) {
        _vLeftLine = [[UIView alloc]init];
        _vLeftLine.backgroundColor = [UIColor whiteColor];
    }
    return _vLeftLine;
}

- (UIView*)vRightLine{
    if (!_vRightLine) {
        _vRightLine = [[UIView alloc]init];
        _vRightLine.backgroundColor = [UIColor whiteColor];
    }
    return _vRightLine;
}

- (UILabel*)lbVendorInfo{
    if (!_lbVendorInfo) {
        _lbVendorInfo = [[UILabel alloc]init];
        _lbVendorInfo.font = [UIFont systemFontOfSize:12];
        _lbVendorInfo.textColor = [UIColor whiteColor];
        _lbVendorInfo.text = @"第三方帐号登录";
        _lbVendorInfo.textAlignment = NSTextAlignmentCenter;
    }
    return _lbVendorInfo;
}

- (UIButton*)btnQQ{
    if (!_btnQQ) {
        _btnQQ = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnQQ setImage:[UIImage imageNamed:@"login_ico_qq"] forState:UIControlStateNormal];
        [_btnQQ addTarget:self action:@selector(qqAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnQQ;
}

- (UIButton*)btnWeiXin{
    if (!_btnWeiXin) {
        _btnWeiXin = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnWeiXin setImage:[UIImage imageNamed:@"login_ico_wechat"] forState:UIControlStateNormal];
        [_btnWeiXin addTarget:self action:@selector(wechatAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnWeiXin;
}

- (UIButton*)btnWeibo{
    if (!_btnWeibo) {
        _btnWeibo = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnWeibo setImage:[UIImage imageNamed:@"login_ico_weibo"] forState:UIControlStateNormal];
        [_btnWeibo addTarget:self action:@selector(weiboAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnWeibo;
}
@end
