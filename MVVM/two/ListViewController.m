//
//  ListViewController.m
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()
/** <#weak属性注释#> */
@property (nonatomic, strong) ListView *myListView;
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
    [self.view addSubview:self.myListView];
    
    
    RACSignal *requestSiganl= [self.requestViewModel.requeseCommand execute:nil];
    [requestSiganl subscribeNext:^(id  _Nullable x) {
        self.myListView.models = x;
        [self.myListView.tableView reloadData];
        NSLog(@"----------");
    }];

}
#pragma mark - 懒加载
- (UIView *)myListView {
    if (!_myListView) {
        _myListView = [[ListView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
    }
    return _myListView;
}
@end
