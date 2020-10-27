//
//  ListView.m
//  MVVM
//
//  Created by Jeff on 2020/10/27.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import "ListView.h"

@implementation ListView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.tableView.dataSource = self;
        self.tableView.delegate=self;
        [self addSubview:self.tableView];
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 2.0 秒后异步追加任务代码到主队列，并开始执行
//            NSLog(@"after---%@",[NSThread currentThread]);  // 打印当前线程
//
//
//
//        });
        
    }
    return self;
}
-(void)bindRac
{
//    RACSignal *requestSiganl= [self.requeseCommand execute:nil];
//    [requestSiganl subscribeNext:^(id  _Nullable x) {
//        self.models = x;
//        [self.tableView reloadData];
//        NSLog(@"----------");
//    }];
    
    [self.requestSiganl subscribeNext:^(id  _Nullable x) {
        self.models = x;
        [self.tableView reloadData];
        NSLog(@"----------");
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BookTableViewCell *cell = [BookTableViewCell cellWithTableView:tableView];
    cell.book=self.models[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    BookModel *book= self.models[indexPath.row];
//    UIViewController *vc = [[UIViewController alloc]init];
//    vc.title=book.title;
//    vc.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController pushViewController:vc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
@end
