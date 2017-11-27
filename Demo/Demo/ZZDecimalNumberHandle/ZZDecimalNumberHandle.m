//
//  ZZDecimalNumberHandle.m
//
//  Created by liuweizhen on 2017/11/27.
//  Copyright © 2017年 liuxing8807@126.com. All rights reserved.
//

#import "ZZDecimalNumberHandle.h"

@interface ZZDecimalNumberHandle()

@property (nonatomic, strong, readwrite) NSDecimalNumber *decimalNumber;
@end

@implementation ZZDecimalNumberHandle

- (instancetype)init {
    if (self = [super init]) {
        self.decimalNumber = [NSDecimalNumber zero];
    }
    return self;
}

- (instancetype)initWithChar:(char)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithChar:value];
    }
    return self;
}

- (instancetype)initWithUnsignedChar:(unsigned char)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithUnsignedChar:value];
    }
    return self;
}

- (instancetype)initWithBool:(BOOL)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithBool:value];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithCoder:value];
    }
    return self;
}

// decimalNumberWithMantissa:exponent:isNegative:
// + decimalNumberWithString:

- (instancetype)initWithShort:(short)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithShort:value];
    }
    return self;
}

- (instancetype)initWithUnsignedShort:(unsigned short)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithUnsignedShort:value];
    }
    return self;
}

- (instancetype)initWithInt:(int)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithInt:value];
    }
    return self;
}

- (instancetype)initWithUnsignedInt:(unsigned int)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithUnsignedInt:value];
    }
    return self;
}

- (instancetype)initWithInteger:(NSInteger)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithInteger:value];
    }
    return self;
}

- (instancetype)initWithUnsignedInteger:(NSUInteger)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithUnsignedInteger:value];
    }
    return self;
}

- (instancetype)initWithLong:(long)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithLong:value];
    }
    return self;
}

- (instancetype)initWithUnsignedLong:(unsigned long)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithUnsignedLong:value];
    }
    return self;
}

- (instancetype)initWithLongLong:(long long)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithLongLong:value];
    }
    return self;
}

- (instancetype)initWithUnsignedLongLong:(unsigned long long)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithUnsignedLongLong:value];
    }
    return self;
}

- (instancetype)initWithFloat:(float)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithFloat:value];
    }
    return self;
}

- (instancetype)initWithDouble:(double)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithDouble:value];
    }
    return self;
}

- (instancetype)initWithString:(NSString *)value {
    if (self = [super init]) {
        self.decimalNumber = [[NSDecimalNumber alloc] initWithString:value];
    }
    return self;
}

+ (ZZDecimalNumberHandle *)decimalNumberHandleWithMantissa:(unsigned long long)mantissa exponent:(short)exponent isNegative:(BOOL)flag {
    ZZDecimalNumberHandle *handle = [[ZZDecimalNumberHandle alloc] init];
    handle.decimalNumber = [NSDecimalNumber decimalNumberWithMantissa:mantissa exponent:exponent isNegative:flag];
    return handle;
}

+ (ZZDecimalNumberHandle *)decimalNumberHandleWithDecimal:(NSDecimal)dcm {
    ZZDecimalNumberHandle *handle = [[ZZDecimalNumberHandle alloc] init];
    handle.decimalNumber = [NSDecimalNumber decimalNumberWithDecimal:dcm];
    return handle;
}

+ (ZZDecimalNumberHandle *)decimalNumberHandleWithString:(NSString *)numberValue {
    ZZDecimalNumberHandle *handle = [[ZZDecimalNumberHandle alloc] init];
    handle.decimalNumber = [NSDecimalNumber decimalNumberWithString:numberValue];
    return handle;
}

+ (ZZDecimalNumberHandle *)decimalNumberHandleWithString:(NSString *)numberValue locale:(id)locale {
    ZZDecimalNumberHandle *handle = [[ZZDecimalNumberHandle alloc] init];
    handle.decimalNumber = [NSDecimalNumber decimalNumberWithString:numberValue locale:locale];
    return handle;
}

- (ZZDecimalNumberHandle *(^)(short))addShort {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(short value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithShort:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByAdding:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(unsigned short))addUnsignedShort {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(unsigned short value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithUnsignedShort:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByAdding:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(int))addInt {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(int value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithInt:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByAdding:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(unsigned int))addUnsignedInt {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(unsigned int value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithUnsignedInt:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByAdding:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(NSInteger))addInteger {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(NSInteger value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithInteger:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByAdding:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(long))addLong {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(long value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithLong:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByAdding:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(long long))addLongLong {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(long long value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithLongLong:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByAdding:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(unsigned long long))addUnsignedLongLong {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(unsigned long long value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithUnsignedLongLong:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByAdding:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(float))addFloat {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(float value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithFloat:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByAdding:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(double))addDouble {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(double value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithDouble:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByAdding:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(NSDecimalNumber *))addNumber {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(NSDecimalNumber *dNumber) {
        if (dNumber) {
            weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByAdding:dNumber];
        }
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(short))substractShort {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(short value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithShort:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberBySubtracting:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(unsigned short))substractUnsignedShort {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(unsigned short value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithUnsignedShort:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberBySubtracting:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(int))substractInt {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(int value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithInt:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberBySubtracting:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(unsigned int))substractUnsignedInt {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(unsigned int value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithUnsignedInt:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberBySubtracting:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(NSInteger))substractInteger {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(NSInteger value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithInteger:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberBySubtracting:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(long))substractLong {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(long value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithLong:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberBySubtracting:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(long long))substractLongLong {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(long long value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithLongLong:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberBySubtracting:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(unsigned long long))substractUnsignedLongLong {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(unsigned long long value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithUnsignedLongLong:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberBySubtracting:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(float))substractFloat {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(float value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithFloat:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberBySubtracting:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(double))substractDouble {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(double value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithDouble:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberBySubtracting:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(NSDecimalNumber *))substractNumber {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(NSDecimalNumber *dNumber) {
        if (dNumber) {
            weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberBySubtracting:dNumber];
        }
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(short))multiplyShort {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(short value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithShort:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByMultiplyingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(unsigned short))multiplyUnsignedShort {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(unsigned short value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithUnsignedShort:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByMultiplyingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(int))multiplyInt {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(int value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithInt:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByMultiplyingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(unsigned int))multiplyUnsignedInt {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(unsigned int value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithUnsignedInt:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByMultiplyingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(NSInteger))multiplyInteger {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(NSInteger value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithInteger:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByMultiplyingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(long))multiplyLong {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(long value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithLong:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByMultiplyingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(long long))multiplyLongLong {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(long long value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithLongLong:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByMultiplyingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(unsigned long long))multiplyUnsignedLongLong {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(unsigned long long value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithUnsignedLongLong:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByMultiplyingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(float))multiplyFloat {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(float value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithFloat:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByMultiplyingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(double))multiplyDouble {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(double value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithDouble:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByMultiplyingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(NSDecimalNumber *))multiplyNumber {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(NSDecimalNumber *dNumber) {
        if (dNumber) {
            weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByMultiplyingBy:dNumber];
        }
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(short))divideShort {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(short value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithShort:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByDividingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(unsigned short))divideUnsignedShort {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(unsigned short value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithUnsignedShort:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByDividingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(int))divideInt {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(int value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithInt:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByDividingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(unsigned int))divideUnsignedInt {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(unsigned int value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithUnsignedInt:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByDividingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(NSInteger))divideInteger {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(NSInteger value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithInteger:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByDividingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(long))divideLong {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(long value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithLong:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByDividingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(long long))divideLongLong {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(long long value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithLongLong:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByDividingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(unsigned long long))divideUnsignedLongLong {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(unsigned long long value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithUnsignedLongLong:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByDividingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(float))divideFloat {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(float value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithFloat:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByDividingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(double))divideDouble {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(double value) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithDouble:value];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByDividingBy:dNumber];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(NSDecimalNumber *))divideNumber {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(NSDecimalNumber *dNumber) {
        if (dNumber) {
            weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByDividingBy:dNumber];
        }
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(void))rounding {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *() {
        return weakSelf.roundingByScale(0);
    };
}

- (ZZDecimalNumberHandle *(^)(float))roundingFloat {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(float value) {
        return weakSelf.roundingFloatByScale(value, 0);
    };
}

- (ZZDecimalNumberHandle *(^)(double))roundingDouble {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(double value) {
        return weakSelf.roundingDoubleByScale(value, 0);
    };
}

- (ZZDecimalNumberHandle *(^)(NSDecimalNumber *))roundingNumber {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(NSDecimalNumber *dNumber) {
        return weakSelf.roundingNumberByScale(dNumber, 0);
    };
}

- (ZZDecimalNumberHandle *(^)(short))roundingByScale {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(short scale) {
        NSDecimalNumberHandler *behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:scale raiseOnExactness:YES raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
        weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByRoundingAccordingToBehavior:behavior];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(float, short))roundingFloatByScale {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(float value, short scale) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithFloat:value];
        NSDecimalNumberHandler *behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:scale raiseOnExactness:YES raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
        weakSelf.decimalNumber = [dNumber decimalNumberByRoundingAccordingToBehavior:behavior];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(double, short))roundingDoubleByScale {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(double value, short scale) {
        NSDecimalNumber *dNumber = [[NSDecimalNumber alloc] initWithDouble:value];
        NSDecimalNumberHandler *behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:scale raiseOnExactness:YES raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
        weakSelf.decimalNumber = [dNumber decimalNumberByRoundingAccordingToBehavior:behavior];
        return weakSelf;
    };
}

- (ZZDecimalNumberHandle *(^)(NSDecimalNumber *, short))roundingNumberByScale {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *(NSDecimalNumber *dNumber, short scale) {
        if (dNumber) {
            NSDecimalNumberHandler *behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:scale raiseOnExactness:YES raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
            weakSelf.decimalNumber = [dNumber decimalNumberByRoundingAccordingToBehavior:behavior];
        }
        return weakSelf;
    };
}

/**
+ (NSDecimalNumber *)getAbsolute:(NSDecimalNumber *)num {
    if ([num compare:[NSDecimalNumber zero]] == NSOrderedAscending) {
        // Number is negative. Multiply by -1
        NSDecimalNumber * negativeOne = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:0 isNegative:YES];
        return [num decimalNumberByMultiplyingBy:negativeOne];
    } else {
        return num;
    }
}
*/

// https://stackoverflow.com/questions/846254/absolute-value-abs-of-nsdecimalnumber-without-loss-of-precision
- (ZZDecimalNumberHandle *(^)(void))absolute {
    __weak __typeof(self) weakSelf = self;
    return ^ZZDecimalNumberHandle *() {
        if ([weakSelf.decimalNumber compare:[NSDecimalNumber zero]] == NSOrderedAscending) {
            NSDecimalNumber *negativeOne = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:0 isNegative:YES];
            weakSelf.decimalNumber = [weakSelf.decimalNumber decimalNumberByMultiplyingBy:negativeOne];
        }
        return weakSelf;
    };
}

@end
