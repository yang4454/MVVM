//
//  modelView.h
//  MVVM
//
//  Created by Jeff on 2020/10/16.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface modelView : NSObject
@property(nonatomic,strong)AccountModel *account;
@property(nonatomic,strong)RACSignal *listeningSignal;
@property(nonatomic,strong)RACSubject *btnColorSubject;
@property(nonatomic,strong)RACCommand *loginCommand;
//@property(nonatomic,strong)UINavigationController *nav;
@end

NS_ASSUME_NONNULL_END
