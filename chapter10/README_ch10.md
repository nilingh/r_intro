# 10 编写函数

正如前面内容所暗示的一样，R 语言允许用户创建自己的函数对象(objects of mode *function*)。R 有一些内部函数可以用在其他的表达式中。通过这个过程，R 在程序的功能性，便利性和优美性上得到了扩展。学写这些有用的函数是一个人轻松地创造性地使用 R 的最主要的方式。

需要强调的是，大多数函数都作为 R 系统的一部分而提供，如 `mean()`，`var()`， `postscript()` 等等。这些函数都是用 R 写的，因此在本质上和用户写的没有差别。

一个函数是通过下面的语句形式定义的

```R
> name <- function(arg 1 , arg 2 , ...) expression
```

其中 *expression* 是一个 R 表达式(常常是一个成组表达式)，它利用参数 *arg_i* 计算最终的结果。该表达式的值就是函数的返回值。

可以在任何地方以 `name(expr1 , expr2 , ...)` 的形式调用函数。

* [10.1 一个简单的例子](chapter10/section10_1.md)
* [10.2 定义新的二元操作符](chapter10/section10_2.md)
* [10.3 参数命名和默认值](chapter10/section10_3.md)
* [10.4 ... 参数](chapter10/section10_4.md)
* [10.5 在函数中赋值](chapter10/section10_5.md)
* [10.6 更多高级的例子](chapter10/section10_6.md)
  * [10.6.1 区组设计中的效率因子](chapter10/section10_6_1.md)
  * [10.6.2 去除打印数组中的名字](chapter10/section10_6_2.md)
  * [10.6.3 递归式的数值积分](chapter10/section10_6_3.md)
* [10.7 作用域](chapter10/section10_7.md)
* [10.8 定制环境](chapter10/section10_8.md)
* [10.9 类，泛型函数和面向对象](chapter10/section10_9.md)