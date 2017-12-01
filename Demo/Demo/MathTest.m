//
//  MathTest.m
//  Demo
//
//  Created by liuweizhen on 2017/11/27.
//  Copyright © 2017年 liuxing8807@126.com. All rights reserved.
//  http://www.jianshu.com/p/6c403be08488?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation

#import "MathTest.h"
#import "ZZDecimalNumberHandle.h"

@implementation MathTest

- (void)test {
    // [self test_1];
    [self test_2];
    // [self test_3];
    // [self test_4];
//    [self test_5];
}

- (void)test_1 {
    CGFloat totalPrice = 0.0;
    NSInteger count = 3;
    NSInteger salesPrice = 990;
    totalPrice += count*salesPrice/100.0;
    NSLog(@"%lf", totalPrice); // 29.700000
    // 控制台po和NSLog的结果不一样:
    // NSLog --> 29.700000
    // po totalPrice --> 29.6999999999999990
}

- (void)test_2 {
    CGFloat price = 78.60;
    NSString *priceStr = [NSString stringWithFormat:@"%lf", price];
    NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithDouble:price];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:[NSNumber numberWithFloat:price] forKey:@"price_float"];
    [params setObject:[NSNumber numberWithDouble:price] forKey: @"price_double"];
    [params setObject:priceStr forKey: @"priceStr"];
    [params setObject:dNumber forKey: @"dNumber"];
    
    NSLog(@"price --> %lf", price);  // 78.600000
    NSLog(@"priceStr --> %@", priceStr); // 78.600000
    NSLog(@"dNumber --> %@", dNumber); // 78.59999999999999
    NSLog(@"params --> %@", params);
    /**
     {
     dNumber = "78.6";
     priceStr = "78.600000";
     "price_double" = "78.59999999999999";
     "price_float" = "78.6";
     }
     */
    
    // But, if put double to Dictionary in java, it's ok:
    /**
    double price = 78.6;
    System.out.println(price); // 78.6
    Map<String, Double> hashMap = new HashMap<String, Double>();
    hashMap.put("price", price);
    System.out.println(hashMap); {price=78.6}
     */
}

- (void)test_3 {
    // NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithFloat:78.6000];
    NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithFloat:78.678];
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:2 raiseOnExactness:YES raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
    dNumber = [dNumber decimalNumberByRoundingAccordingToBehavior:handler];
    NSLog(@"dNumber --> %@", dNumber);                          // 78.67999999999999
    NSLog(@"dNumber floatValue --> %lf", dNumber.floatValue);   // 78.680000
    NSLog(@"dNumber doubleValue --> %lf", dNumber.doubleValue); // 78.680000
    NSLog(@"dNumber stringValue --> %@", dNumber.stringValue);  // 78.68
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:dNumber forKey:@"dNumber"];
    [params setObject:[NSNumber numberWithDouble:dNumber.floatValue] forKey:@"dNumber floatValue"];
    [params setObject:[NSNumber numberWithDouble:dNumber.doubleValue] forKey:@"dNumber doubleValue"];
    [params setObject:dNumber.stringValue forKey:@"dNumber stringValue"];
    NSString *priceStr = dNumber.stringValue;
    [params setObject:@([priceStr doubleValue]) forKey:@"dNumber_stringValue_doubleValue"];
    NSLog(@"%@", params);
    /**
     {
     dNumber = "78.68";
     "dNumber doubleValue" = "78.67999999999999";
     "dNumber floatValue" = "78.68000030517578";
     "dNumber stringValue" = "78.68";
     "dNumber_stringValue_doubleValue" = "78.68000000000001";
     }
     */
}

- (void)test_4 {
    NSString *value = @"0.01";
    if ([value floatValue] < 0.01) {
        NSLog(@"1. No no no..."); // No no no...
    }
    if ([value doubleValue] < 0.01) {
        NSLog(@"2. No no no...");
    }
    if ([value floatValue] < 0.01f) {
        NSLog(@"3. No no no...");
    }
    
    NSDecimalNumber *dNumber_1 = [[NSDecimalNumber alloc] initWithFloat:[value floatValue]];
    NSDecimalNumber *dNumber_2 = [[NSDecimalNumber alloc] initWithFloat:[value doubleValue]];
    if ([dNumber_1 compare:dNumber_2] == NSOrderedSame) {
        NSLog(@"Equal"); // Equal
        // typedef NS_ENUM(NSInteger, NSComparisonResult) {NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending};
    }
}

- (void)test_5 {
    ZZDecimalNumberHandle *handle = [[ZZDecimalNumberHandle alloc] initWithInt:3];
    NSLog(@"%@", handle.addInt(3).addInt(5).divideFloat(2.0).decimalNumber);
    NSLog(@"%lf", handle.addInt(3).addInt(5).divideFloat(2.0).decimalNumber.doubleValue);
    NSLog(@"%@", handle.addInt(3).addInt(5).divideFloat(2.0).decimalNumber.stringValue);
}

@end
