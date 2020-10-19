//
//  BookModel.h
//  MVVM
//
//  Created by Jeff on 2020/10/19.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookModel : NSObject
@property(nonatomic,strong)NSString *title;
//@property(nonatomic,strong)NSString *author;
//@property(nonatomic,strong)NSString *pubdate;
//@property(nonatomic,strong)NSString *image;
//@property(nonatomic,strong)NSString *binding;
//@property(nonatomic,strong)NSString *catalog;
+(BookModel*)bookWithDict:(NSDictionary*)dict;
@end

NS_ASSUME_NONNULL_END
