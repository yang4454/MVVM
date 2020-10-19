//
//  ListViewModel.m
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import "ListViewModel.h"
#import "Netwrok.h"
#import "BookModel.h"


@implementation ListViewModel
-(instancetype)init{
    if (self = [super init]) {
        [self initabBind];
    }
    return self;
}
-(void)initabBind{
    
    _requeseCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            // 这里进行一个网络请求
            
            // 如果请求成功就发送next和complete事件,如果失败就发送error事件
            
            BookModel *model = [BookModel bookWithDict:@{@"title": @"[丛书] 深度学习系列"}];
            NSMutableArray *dataMuArray = @[].mutableCopy;
            [dataMuArray addObject:model];
            
            [subscriber sendNext:dataMuArray];
            
            // 这里记住一定要调用sendCompleted方法，因为不调用完成这个方法，信号就不会销毁，一直占用着内存，这个是开发者们最不希望看到的
            [subscriber sendCompleted];
            //        [subscriber sendError:nil];
            return [RACDisposable disposableWithBlock:^{
                NSLog(@"默认信号发送完毕后就会被销毁，没有订阅者的时候就会被销毁");
            }];
        }];
    }];

}

@end
