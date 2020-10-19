//
//  modelView.m
//  MVVM
//
//  Created by Jeff on 2020/10/16.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import "modelView.h"

@implementation modelView
-(AccountModel*)account{
    if (!_account) {
        _account = [[AccountModel alloc]init];
    }
    return _account;
}

-(instancetype)init{
    if (self=[super init]) {
        [self initalBind];
    }
    return self;
}

-(void)initalBind{
    //创建信号 通过combinelatest 讲两个型号组合一起 通过一个宏RACObserve 来观察Account 里面的 属性的变化
    _listeningSignal = [RACSignal combineLatest:@[RACObserve(self.account, userName),RACObserve(self.account, pwd)] reduce:^id(NSString *account,NSString *pwd){
        这里就判断 发送哪个信号出去 用来改变颜色
//        if (account.length && pwd.length) {
//            [self.btnColorSubject sendNext:@1];
//        } else {
//             [self.btnColorSubject sendNext:@2];
//        }
        return @(account.length&&pwd.length);
    }];
    //创建一个RACCommand 事件
    // 1.signalBlock必须要返回一个信号，不能传nil.
    // 2.如果不想要传递信号，直接创建空的信号[RACSignal empty];
    // 3.RACCommand中信号如果数据传递完，必须调用[subscriber sendCompleted]，这时命令才会执行完毕，否则永远处于执行中。
    // 4.RACCommand需要被强引用，否则接收不到RACCommand中的信号，因此RACCommand中的信号是延迟发送的。
    _loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        RACSignal *loginSignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            这里就是模拟网络的一个block
            [Netwrok getData:^(NSString *str) {
                [subscriber sendNext:str];
                [subscriber sendCompleted];
            }] ;
            return  [RACDisposable disposableWithBlock:^{
                NSLog(@"信号销毁");
            }];
        }];
        return loginSignal;
    }];
    //这里就是订阅command 里面的信号 根据不同信号来跳转 和 处理业务
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
        if ([x isEqualToString:@"成功"]) {
            ListViewController *vc = [[ListViewController alloc]init];
            [self.nav pushViewController:vc animated:YES];
        }
    }];
    //这里就是订阅 command 里面的 信号 使用skip 是过滤第一个信号因为默认会调用一次
    [[_loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        NSLog(@"%@",x);
        if ([x isEqual:@(YES)]) {
            NSLog(@"正在登录");
        }else{
            NSLog(@"%@",x);
        }
    }];
}
@end
