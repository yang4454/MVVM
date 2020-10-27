//
//  ListView.h
//  MVVM
//
//  Created by Jeff on 2020/10/27.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface ListView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *models;
/** strong属性注释 */
@property(nonatomic,strong)RACCommand *requeseCommand;
@property(nonatomic,strong)RACSignal *requestSiganl;
-(void)bindRac;
@end

NS_ASSUME_NONNULL_END
