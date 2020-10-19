//
//  ListViewModel.h
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface ListViewModel : NSObject
@property(nonatomic,strong)RACCommand *requeseCommand;
@property(nonatomic,strong)RACSubject *subject;
//@property(nonatomic,strong)UINavigationController *nav; 

@end

NS_ASSUME_NONNULL_END
