//
//  ListViewController.m
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

-(ListViewModel*)requestViewModel{
    if (!_requestViewModel) {
        _requestViewModel = [[ListViewModel alloc]init];
    }
    return _requestViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.dataSource = self;
    self.tableView.delegate=self;
    [self.view addSubview:self.tableView];
    
    
    RACSignal *requestSiganl = [self.requestViewModel.requeseCommand execute:nil];
    [requestSiganl subscribeNext:^(id  _Nullable x) {
        self.models = x;
        [self.tableView reloadData];
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
    BookModel *book= self.models[indexPath.row];
    UIViewController *vc = [[UIViewController alloc]init];
    vc.title=book.title;
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
@end
