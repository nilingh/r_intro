# 12.5.3 图片边缘

R 里面一个单独的图被称为 `figure`。它还包括一个被边缘(可能包括轴标签，标 题等)和坐标轴包围的*绘图区域(plot region)*。

一个典型的图为

![images/fig11](https://cran.r-project.org/doc/manuals/r-release/images/fig11.png)

控制图版面的图形参数有：

```R
mai=c(1, 0.5, 0.5, 0) 
```

分别表示底部，左边，上部和右边的空间，单位是英寸。

```R
mar=c(4, 2, 2, 1) 
```

和 `mai` 相似，只是度量单位采用文本行。

`mar`和 `mai` 是等价的因为二者可以相互转换。这些参数的默认值常常有点大；右侧边缘常常是不需要的，没有标题时，顶部边缘也不是需要的。底部和左侧足以用来绘制坐标轴和刻度标记。需要说明的时，默认值没有考虑到设备层面；例如，用设定参数 `height=4` 的 `postscript()` 驱动会导致一个图有50%的边缘。这时可以显式地设 置 `mar` 或者 `mai`。当使用多重图形是(下面会讨论)，边缘会减少，不过在很多图共享一页时这还是不够的。