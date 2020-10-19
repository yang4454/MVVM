//
//  BookTableViewCell.m
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import "BookTableViewCell.h"

@implementation BookTableViewCell

+(instancetype)cellWithTableView:(UITableView*)tableView{
    static NSString *identfier = @"BookTableViewCell";
    //先在缓存池中取
    BookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfier];
    //缓存池中没有再创建，并添加标识，cell移出屏幕时放入缓存池以复用
    if (cell == nil) {
        cell = [[BookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfier];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
        [self.contentView addSubview:self.titleLabel];

        self.dextLabel= [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 200, 20)];
        [self.contentView addSubview:self.dextLabel];
    }
    return self;
}

-(void)setBook:(BookModel *)book{
    _book = book;
    self.titleLabel.text = book.title;
//    self.dextLabel.text = book.pubdate;
} 

@end
