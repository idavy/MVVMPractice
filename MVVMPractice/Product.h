//
//  Product.h
//  MVVMPractice
//
//  Created by Dave on 15/11/6.
//  Copyright © 2015年 Dave. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ProductColor) {
	Red   = 1,
	Green = 2
};


@interface SomeThing : NSObject
@property (nonatomic,strong) NSString *str;
@end

@interface Product : NSObject
@property (nonatomic,strong) SomeThing *thing;
@property (nonatomic,assign) ProductColor color;
@property (nonatomic,assign) float weight;
@end
