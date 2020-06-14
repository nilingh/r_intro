12.1.3 图形显示

其他高级绘图函数可以产生多种类型的图。一些例子是:

```R
qqnorm(x)
qqline(x)
qqplot(x, y)
```

* 分位比较图。第一种形式显示数值向量 `x` 相对期望的正态有序分值(Normal order scores)的比较图(正态分值图)；第二种形式是在这个图上加一条理论上的分 位对分位的直线。第三种形式产生 `x` 的分位对 `y` 的分位的图以比较二者的分布是否一致。

```R
hist(x)
hist(x, nclass=n)
hist(x, breaks=b, …)
```

* 产生数值向量 `x` 的柱状分布图。程序会自动选择适合的分类数目，但可以通过设定参数 `nclass=` 来改变分类数。还有一种方法是，通过参数 `breaks=` 精确设置断点(breakpoint)。如果设定参数 `probability=TRUE`，柱高度将表示频率(frequencies)而不是频数(counts)。

```R
dotchart(x, …)
```

* 产生数据 `x` 的点图。在一个点图里面，*y-*轴给定 `x` 里 面数据的标签，*x-*轴给出它们的值。这种图非常容易从视觉上看出在某个特定范围内的数据元素。

```R
image(x, y, z, …)
contour(x, y, z, …)
persp(x, y, z, …)
```

* 画三变量图。`image` 产生一个长方形的网格，用不同的颜色表示 `z` 的值，`contour` 以等高线(contour line)来表示 `z` 的值，`persp` 产生一个3D表面。