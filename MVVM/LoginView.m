//
//  LoginView.m
//  MVVM
//
//  Created by Jeff on 2020/10/27.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.nameTextField];
        [self addSubview:self.pwdTextField];
        [self addSubview:self.loginBtn];
        
    }
    return self;
}
#pragma mark - 懒加载
- (UITextField *)nameTextField {
    if (!_nameTextField) {
        _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, 100, 50)];
    }
    return _nameTextField;
}
#pragma mark - 懒加载
- (UITextField *)pwdTextField {
    if (!_pwdTextField) {
        _pwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 150, 100, 50)];
    }
    return _pwdTextField;
}
#pragma mark - 懒加载
- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 100, 50)];
        _loginBtn.backgroundColor = [UIColor redColor];
        _loginBtn.enabled = NO;
    }
    return _loginBtn;
}

@end
