//
//  ViewController.m
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(LoginViewModel*)viewModel{
    if (!_viewModel) {
        _viewModel = [[LoginViewModel alloc]init];
    }
    return _viewModel;
}
#pragma mark - 懒加载
- (UIView *)loginView {
    if (!_loginView) {
        _loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    }
    return _loginView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.loginView];
    
    //1.
    //这里就是监听 每个控件值的变化
    RAC(self.viewModel.account,userName) = self.loginView.nameTextField.rac_textSignal;
    RAC(self.viewModel.account,pwd) = self.loginView.pwdTextField.rac_textSignal;
    RAC(self.loginView.loginBtn,enabled) = self.viewModel.listeningSignal;
    ///这里是监听按钮的颜色 是有可以点击的时候改变颜色
    ///1. 这种方式是直接 监听按钮的一个enabled 属性，是否可以点击
    [RACObserve(self.loginView.loginBtn, enabled) subscribeNext:^(id x) {
        if ([x isEqual:@1]) {
             self.loginView.loginBtn.backgroundColor = [UIColor greenColor];
        } else {
             self.loginView.loginBtn.backgroundColor = [UIColor redColor];
        }
        NSLog(@"是否可以点击%@",x);
    }];
//    2. 这种是再viewmodel 里面再创建一个RACSubject 信号 用来发送信号以便改变颜色
//    self.viewModel.btnColorSubject = [RACSubject subject];
//    [self.viewModel.btnColorSubject subscribeNext:^(id  _Nullable x) {
//        if ([x isEqual:@1]) {
//             self.loginBtn.backgroundColor = [UIColor greenColor];
//        } else {
//             self.loginBtn.backgroundColor = [UIColor redColor];
//        }
//        NSLog(@"----%@",x);
//    }];
    /*这里就是 导航栏 放到ViewModel里面。也有人认为放到C里面去跳转。我个人比较倾向在ViewModel里面去跳转，既然ViewModel里面都是出来业务逻辑，那么跳转也应该属于其中一部分。*/
    self.viewModel.nav = self.navigationController;
//    监听按钮的点击事件，当按钮收到可以点击事件的时候 LoginCommand 就可以执行 execute 执行命名
    [[self.loginView.loginBtn rac_signalForControlEvents:1<<6] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self.viewModel.loginCommand execute:nil];
    }];
}

@end
