# ZZDecimalNumberHandle
备记做项目时遇到的一些精度计算问题(注：实际项目中牵涉到钱的运算，一律要用整型，比如全用分的形式，显示形式可以变化小数)

在关联货币运算时, 遇到头疼的精度问题, Apple建议使用NSDecimalNumber做处理, 我对此作了一点点封装, 在此备记.

计算机在十进制中无法精确表示一些小数, 比如0.6:

```objective-c
         0.6
          *2
       --------
         1.2 ----> 1
          *2
       --------
         0.4 ----> 0
          *2
       --------
         0.8 ----> 0
          *2
       --------
         1.6 ----> 1
          *2
       --------
         1.2 ----> 1
          *2
       --------
         0.4 ----> 0
          *2
       --------
         0.8 ----> 0
          *2
       --------
         1.6 ----> 1
        ......
 11001100110011001100... 1100无穷尽
```

在实际的操作中, 精度问题确实需要注意, 来看个示例:

```objective-c
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
```

在上面的示例中, `[value floatValue] < 0.01`成立, 这是因为编译器看到小数, 默认作为double处理, 而float和double表示的精度是不一样的, 在Java中我作了测试, 也是一样的. 但是下面这个问题就有点不好理解了:

```objective-c
double price = 78.6;
NSLog(@"%lf", price); // 78.600000
NSDictionary *dict = @{@"price" : @(price)};
NSLog(@"%@", dict);
/**
{
    price = "78.59999999999999";
}
*/
```

价格price打印出来竟然是78.59999999999999, 如果把这个字典作为键值传给服务器问题就麻烦了.

这一点不可理解, 在Java测试中把price放入HashMap并System.out.println(map)不存在此问题, 看来和编译器也有关系了.  

```java
public class TestMath {
    public static void main(String[] args) {
        double price = 2.0 - 1.1;
        System.out.println(price + ""); // 0.8999999999999999
        System.out.println((2.0-1.1)); // 0.8999999999999999
        //使用字符串构造BigDecimal对象
        BigDecimal a = new BigDecimal("2.0");
        BigDecimal b = new BigDecimal("1.1");
        BigDecimal result = a.subtract(b);
        System.out.println(result); // 0.9
        System.out.println(result + ""); // 0.9
    }
}
```

```objective-c
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        double price = 2.0 - 1.1;
        NSLog(@"%lf", price); // 0.900000
        NSLog(@"%lf", 2.0-1.1); // 0.900000
        NSDictionary *dict = @{@"price" : @(price)};
        NSLog(@"%@", dict); // {price = "0.8999999999999999";}
    }
    return 0;
}
```

 既然Apple建议使用NSDecimalNumber, 我们再作个测试:

```objective-c
double price = 78.6;
NSLog(@"%lf", price); // 78.600000
// 通过控制台po得到的结果是: po price --> 78.599999999999994
NSDecimalNumber *decimalNumber = [[NSDecimalNumber alloc] initWithDouble:price];
NSLog(@"%@", decimalNumber); // 78.59999999999999
// 通过控制台po得到的结果是: po decimalNumber --> 78.6
NSDictionary *dict = @{@"price" : @(price), @"decimalNumber" : decimalNumber};
NSLog(@"%@", dict);
/**
{
    decimalNumber = "78.6";
    price = "78.59999999999999";
}
*/
```

price的结果: `po: 78.599999999999994   NSLog: 78.600000    字典中的值: 78.59999999999999`

decimalNumber的结果: `po: 78.6   NSLog: 78.59999999999999 字典中的值: 78.6`

好吧, 看来不能指望NSLog了. 如此, 要正确的把值传给服务器, 干脆直接用NSDecimalNumber存入NSDictionary中得了.  不过有时候, 我们希望把给服务器上传的字段封装在一个Model中, 但是经测试发现, 无论使用MJExtension还是YYModel, 还是有这个问题, 这并不是这些第三方框架的问题. 所以使用Model时作为传输媒介时, 也要注意这种问题. 

在支付宝App应用上, 测试给朋友转钱也是精确到分, 分以下不支持. 所以针对钱这种问题最好一律是以分为单位, 不存在小数问题, 整数的最小单位是1, 1在二进制表示中就是0001, 所以不存在精度丢失问题. 

NSDecimalNumber使用起来有点烦琐, 我对此作了一点封装, 使用NSDecimalNumber"三下五除二":

```objective-c
ZZDecimalNumberHandle *handle = [[ZZDecimalNumberHandle alloc] initWithInt:3];
NSLog(@"%@", handle.addInt(3).addInt(5).divideFloat(2.0).decimalNumber);
NSLog(@"%lf", handle.addInt(3).addInt(5).divideFloat(2.0).decimalNumber.doubleValue);
NSLog(@"%@", handle.addInt(3).addInt(5).divideFloat(2.0).decimalNumber.stringValue);
```

备记而已, 无技术含量, 详情见Demo.



附:

NSDecimalNumber简单介绍

NSDecimalNumber是NSNumber的子类，比NSNumber的功能更为强大，它们被设计为执行基础10计算，而不会损失精度并具有可预测的舍入行为。

苹果官方建议在货币以及要求精度很高的场景下使用NSDecimalNumber

![](./images/1.png)

```objective-c
+ (instancetype)decimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingMode scale:(short)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero;

* 参数解析:
* roundingMode
 The rounding mode to use. There are four possible values: NSRoundUp, NSRoundDown, NSRoundPlain, and NSRoundBankers.
* scale
 The number of digits a rounded value should have after its decimal point.
* raiseOnExactness
 If YES, in the event of an exactness error the handler will raise an exception, otherwise it will ignore the error and return control to the calling method.
* raiseOnOverflow
 If YES, in the event of an overflow error the handler will raise an exception, otherwise it will ignore the error and return control to the calling method
* raiseOnUnderflow
 If YES, in the event of an underflow error the handler will raise an exception, otherwise it will ignore the error and return control to the calling method
* raiseOnDivideByZero
 If YES, in the event of a divide by zero error the handler will raise an exception, otherwise it will ignore the error and return control to the calling method

当试图除以0或产生一个数表示太大或太小的时候发生异常。
下面列出了各种异常的名字 表明NSDecimalNumber计算错误。
extern NSString *NSDecimalNumberExactnessException; //如果出现一个精确的错误
extern NSString *NSDecimalNumberOverflowException; // 溢出
extern NSString *NSDecimalNumberUnderflowException; //下溢
extern NSString *NSDecimalNumberDivideByZeroException; //除数为0

typedef NS_ENUM(NSUInteger, NSRoundingMode) {
    NSRoundPlain,   // Round up on a tie
    NSRoundDown,    // Always down == truncate
    NSRoundUp,      // Always up
    NSRoundBankers  // on a tie round so last digit is even
};

NSRoundPlain,   // Round up on a tie ／／四舍五入
NSRoundDown,    // Always down == truncate  ／／只舍不入
NSRoundUp,      // Always up    ／／ 只入不舍
NSRoundBankers 四舍六入, 中间值时, 取最近的,保持保留最后一位为偶数
```

From Apple:

![](./images/2.png)
