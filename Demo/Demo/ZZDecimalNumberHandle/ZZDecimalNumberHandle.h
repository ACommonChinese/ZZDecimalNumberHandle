//
//  ZZDecimalNumberHandle.h
//
//  Created by liuweizhen on 2017/11/27.
//  Copyright © 2017年 liuxing8807@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZDecimalNumberHandle : NSObject

- (instancetype)init;
- (instancetype)initWithChar:(char)value;
- (instancetype)initWithUnsignedChar:(unsigned char)value;
- (instancetype)initWithBool:(BOOL)value;
- (instancetype)initWithCoder:(NSCoder *)value;
- (instancetype)initWithShort:(short)value;
- (instancetype)initWithUnsignedShort:(unsigned short)value;
- (instancetype)initWithInt:(int)value;
- (instancetype)initWithUnsignedInt:(unsigned int)value;
- (instancetype)initWithInteger:(NSInteger)value;
- (instancetype)initWithUnsignedInteger:(NSUInteger)value;
- (instancetype)initWithLong:(long)value;
- (instancetype)initWithUnsignedLong:(unsigned long)value;
- (instancetype)initWithLongLong:(long long)value;
- (instancetype)initWithUnsignedLongLong:(unsigned long long)value;
- (instancetype)initWithFloat:(float)value;
- (instancetype)initWithDouble:(double)value;
- (instancetype)initWithString:(NSString *)value;

+ (ZZDecimalNumberHandle *)decimalNumberHandleWithMantissa:(unsigned long long)mantissa exponent:(short)exponent isNegative:(BOOL)flag;
+ (ZZDecimalNumberHandle *)decimalNumberHandleWithDecimal:(NSDecimal)dcm;
+ (ZZDecimalNumberHandle *)decimalNumberHandleWithString:(NSString *)numberValue;
+ (ZZDecimalNumberHandle *)decimalNumberHandleWithString:(NSString *)numberValue locale:(id)locale;

// 加 +
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^addShort)(short value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^addUnsignedShort)(unsigned short value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^addInt)(int value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^addUnsignedInt)(unsigned int value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^addInteger)(NSInteger value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^addLong)(long value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^addLongLong)(long long value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^addUnsignedLongLong)(unsigned long long value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^addFloat)(float value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^addDouble)(double value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^addNumber)(NSDecimalNumber *value);

// 减 -
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^substractShort)(short value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^substractUnsignedShort)(unsigned short value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^substractInt)(int value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^substractUnsignedInt)(unsigned int value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^substractInteger)(NSInteger value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^substractLong)(long value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^substractLongLong)(long long value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^substractUnsignedLongLong)(unsigned long long value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^substractFloat)(float volue);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^substractDouble)(double value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^substractNumber)(NSDecimalNumber *value);

// 乘 *
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^multiplyShort)(short value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^multiplyUnsignedShort)(unsigned short value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^multiplyInt)(int value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^multiplyUnsignedInt)(unsigned int value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^multiplyInteger)(NSInteger value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^multiplyLong)(long value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^multiplyLongLong)(long long value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^multiplyUnsignedLongLong)(unsigned long long value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^multiplyFloat)(float value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^multiplyDouble)(double value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^multiplyNumber)(NSDecimalNumber *value);

// 除 /
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^divideShort)(short value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^divideUnsignedShort)(unsigned short value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^divideInt)(int value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^divideUnsignedInt)(unsigned int value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^divideInteger)(NSInteger value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^divideLong)(long value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^divideLongLong)(long long value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^divideUnsignedLongLong)(unsigned long long value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^divideFloat)(float value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^divideDouble)(double value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^divideNumber)(NSDecimalNumber *value);

// 4舍5入 - 不保留小数
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^rounding)(void);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^roundingFloat)(float value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^roundingDouble)(double value);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^roundingNumber)(NSDecimalNumber *value);

// 4舍5入 - 指定保留小数点后scale位
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^roundingByScale)(short scale);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^roundingFloatByScale)(float value, short scale);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^roundingDoubleByScale)(double value, short scale);
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^roundingNumberByScale)(NSDecimalNumber *value, short scale);

// 绝对值
@property (nonatomic, copy, readonly) ZZDecimalNumberHandle* (^absolute)(void);

@property (nonatomic, strong, readonly) NSDecimalNumber *decimalNumber;

@end
