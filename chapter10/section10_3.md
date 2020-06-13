# 10.3 参数命名和默认值

和[生成正则序列](chapter2/section2_3.md)中提示的一样，如果被调用函数的参数以 “`name=object` ” 方式给出，它们可以用任何顺序设置。但是，参数赋值序列可能以未命名的，位置形式(positional form)的方式给出，同时也有可能在这些位置形式的参数后加上命名参数赋值。

因此，如果有下面方式定义的函数 `fun1`

```R
> fun1 <- function(data, data.frame, graph, limit) {
    [函数主体部分忽略]
  }
```

那么函数将会被好几种方式调用，如

```R
> ans <- fun1(d, df, TRUE, 20)
> ans <- fun1(d, df, graph=TRUE, limit=20)
> ans <- fun1(data=d, limit=20, graph=TRUE, data.frame=df)
```

上面所有的方式是等价的。 

许多时候，参数会被设定一些默认值。如果默认值适合你要做的事情，你可以省略这些参数。例如，函数 `fun1` 用下面的方式定义时

```R
> fun1 <- function(data, data.frame, graph=TRUE, limit=20) { ... }
```

它可以被如下命令调用

```R
> ans <- fun1(d, df)
```

这和前面三种情况等价，而

```R
> ans <- fun1(d, df, limit=10)
```

就改变了一个默认值。

特别说明一下，默认值可以是任何表达式，甚至是函数本身所带有其他参数；它们没有要求是常数。我们的例子采用常数只是使问题简单容易说明。