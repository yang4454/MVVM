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
#import "BookTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface ListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)ListViewModel *requestViewModel;

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *models;

@end

NS_ASSUME_NONNULL_END
