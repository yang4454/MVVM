//
//  ViewController.h
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController
@property(nonatomic,strong)LoginViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@end

NS_ASSUME_NONNULL_END
