# 12.2.1 数学标注

在某些情况下，在一个图上加上数学符号和公式是非常有用的。在 R 里面，这可 以通过函数 `expression` 实现，而不是直接把数学符号和公式加在 `text`，`mtext`，`axis` 或者 `title` 的字符串里面。例如，下面的代码将写出二项式概率分布的公式：

```R
> text(x, y, expression(paste(bgroup("(", atop(n, x), ")"), p^x, q^{n-x})))
```

更多的信息，包括 R 这些特性的列表，可以利用下面的命令得到：

```R
> help(plotmath)
> example(plotmath)
> demo(plotmath)
```

