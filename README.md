# ZZDecimalNumberHandle
备记做项目时遇到的一些精度计算问题

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

价格price打印出来竟然是78.59999999999999, 如果把这个字典作为键值传给服务器问题就麻烦了. 既然Apple建议使用NSDecimalNumber, 我们再作个测试:

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

NSDecimalNumber使用起来有点烦琐, 我对此作了一点封装, 备记, 详情见Demo.





