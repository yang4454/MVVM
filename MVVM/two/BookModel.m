//
//  BookModel.m
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import "BookModel.h"

@implementation BookModel
+(BookModel*)bookWithDict:(NSDictionary *)dict{
    BookModel *book = [[BookModel alloc]init];
    book.title = dict[@"title"];
//    book.author = dict[@"author"];
//    book.pubdate = dict[@"pubdate"];
//    book.image = dict[@"image"];
//    book.catalog = dict[@"catalog"];
    return book;
}
@end
