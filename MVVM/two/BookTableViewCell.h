//
//  BookTableViewCell.h
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface BookTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *dextLabel;
@property(nonatomic,strong)BookModel *book;
+(instancetype)cellWithTableView:(UITableView*)tableView;

@end

NS_ASSUME_NONNULL_END
