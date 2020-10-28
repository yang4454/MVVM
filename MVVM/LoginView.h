//
//  LoginView.h
//  MVVM
//
//  Created by Jeff on 2020/10/27.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginView : UIView
@property (strong, nonatomic) UITextField *nameTextField;
@property (strong, nonatomic) UITextField *pwdTextField;
@property (strong, nonatomic) UIButton *loginBtn;

@property(nonatomic,strong)LoginViewModel *viewModel;
@end

NS_ASSUME_NONNULL_END
