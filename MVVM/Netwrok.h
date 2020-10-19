//
//  Netwrok.h
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^NetWorkBlock)(NSString *str);
typedef void(^NetWorkDataBlock)(id data);
@interface Netwrok : NSObject

+(void)getData:(NetWorkBlock)block;
+(void)getListData:(NetWorkDataBlock)block;

@end

NS_ASSUME_NONNULL_END
