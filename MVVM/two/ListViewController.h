//
//  ListViewController.h
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "ListViewModel.h"
#import "BookModel.h"
#import "ListView.h"
NS_ASSUME_NONNULL_BEGIN

@interface ListViewController : UIViewController
@property(nonatomic,strong)ListViewModel *requestViewModel;


@end

NS_ASSUME_NONNULL_END
