# 12.1.2 显示多元数据

 R 为描绘多元数据提供了两个非常有用的函数。如果 `X` 是一个数值矩阵或者数据框，命令

```R
> pairs(X)
```

将产生 `X` 的列之间两两相对的成对散点图阵列(pairwise scatterplot matrix)。也就是说，`X` 的每一列相对 `X` 的所有其他列而产生 *n(n − 1)* 个图，并且把这些图以阵列个形式显示在图区。这个图形阵列的行列图形尺度一致。

用 *coplot* 处理三个或者四个变量的产生的图可能会更清晰。如果 `a` 和 `b` 是数值向量，`c` 是数值向量或者因子对象(长度都一致)，那么下面的命令

```R
> coplot(a ~ b | c)
```

将产生一系列在给定的 `c` 值下 `a` 对 `b` 的散点图。`c` 是因子对象，这就简单的表示 `a` 在 `c` 各个水平下对 `b` 画的散点图。当 `c`  是数值向量，它将会被分割成一系列条件区间(conditioning intervals)，对于任一区间，区间内 `c` 对应的 `a`，`b` 值将绘制 `a` 对 `b` 的散点图。区间的数值和位置由 `coplot()` 的参数 `given.values=` 控制――函数 `co.intervals()` 用于选择区间。你还可以对两个给定的变量使用下面的命令

```R
> coplot(a ~ b | c + d)
```

产生任何在 `c` 和 `d` 联合区间内的 `a` 对 `b` 的散点图。
函数 `coplot()` 和 `pairs()` 都有一个参数 `panel=`。这个参数可以用来设置各个面板中的图形样式。默认值 `points()` 用来产生散点图，但是通过将低级命令作用于两个向量 `x` 和 `y` 并赋值给参数 `panel=`，你可以产生任何你所期望的图。一个用于 `coplot` 的`panel` 功能的例子是命令 `panel.smooth()`。