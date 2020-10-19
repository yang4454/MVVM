//
//  Netwrok.m
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import "Netwrok.h"

@implementation Netwrok
+(void)getData:(NetWorkBlock)block{
    block(@"成功");
}

+(void)getListData:(NetWorkDataBlock)block{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"q"] = @"基础";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://book.feelyou.top/search/%E6%B7%B1%E5%BA%A6%E5%AD%A6%E4%B9%A0" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"--failure---");
    }];

}
@end
