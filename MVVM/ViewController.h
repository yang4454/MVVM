//
//  ViewController.h
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewModel.h"
#import "LoginView.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController
@property(nonatomic,strong)LoginViewModel *viewModel;
@property(nonatomic,strong) LoginView*loginView;
@end

NS_ASSUME_NONNULL_END
