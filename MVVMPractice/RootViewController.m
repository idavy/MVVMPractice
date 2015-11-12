//
//  RootViewController.m
//  MVVMPractice
//
//  Created by Dave on 15/11/6.
//  Copyright © 2015年 Dave. All rights reserved.
//

#import "RootViewController.h"
#import "Product.h"

@interface RootViewController ()
@property (nonatomic,strong) NSArray *products;
@end

@implementation RootViewController
- (instancetype)init
{
	self = [super init];
	if (self) {
		Product *p1 = [[Product alloc] init];
		p1.color = Red;
		p1.weight = 5;
		
		Product *p2 = [[Product alloc] init];
		p2.color = Red;
		p2.weight = 11;
		
		Product *p3 = [[Product alloc] init];
		p3.color = Red;
		SomeThing *thing = [[SomeThing alloc]init];
		thing.str = @"aa";
		p3.thing = thing;
		p3.weight = 5;
		
		Product *p4 = [[Product alloc] init];
		p4.color = Green;
		SomeThing *bthing = [[SomeThing alloc]init];
		bthing.str = @"bb";
		p4.thing = thing;
		p4.weight = 5;
		
		Product *p5 = [[Product alloc] init];
		p5.color = Green;
		p5.weight = 10;
		
		Product *p6 = [[Product alloc] init];
		p6.color = Green;
		p6.weight = 5;
		_products = @[p1, p2, p3, p4, p5, p6];
	}
	return self;
}

typedef BOOL(^ProductSpectBlock)();

ProductSpectBlock color(ProductColor color)
{
	return ^BOOL(Product *p){
		return [p color] == color;
	};
}

ProductSpectBlock weightBelow(float weight)
{
	return ^BOOL(Product *p){
		return p.weight<weight;
	};
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
//	NSArray *array = [self findProducts:_products byBlock:^BOOL(Product *p){
//		if (p.color == Red && p.weight >  5) {
//			return YES;
//		}
//		return NO;
//	}];
	
	NSArray *array = [self findProducts:_products byBlock:weightBelow(6)];
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"thing.str == \"aa\" "];
	NSArray *array2 = [self.products filteredArrayUsingPredicate:predicate];
}

- (NSArray *)findProducts:(NSArray *)products byBlock:(BOOL (^)())block
{
	NSMutableArray *array = [[NSMutableArray alloc]init];
	for (Product *p in products) {
		if (block(p)) {
			[array addObject:p];
		}
	}
	return array;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
