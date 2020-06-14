# 11.4 方差分析和模型比较

模型拟合函数 `aov(formula, data=data.frame)` 和函数 `lm()` 非常的相似，在泛型函数提取模型信息部分列出的泛型函数同样适用。

需要注意的是 `aov()` 还允许分析多重误差层(multiple error strata)的模型，如裂区实验设计(split plot experiments)，利用区组内信息进行的平衡不完全区组设计(balanced incomplete block design)等。模型公式

```
response ~ mean.formula + Error(strata.formula)
```

指定了一个多层次实验设计，误差层由 *strata.formula* 定义。最简单的情况是，*strata.formula* 是单因素的。它定义了一个双层次的实验，也就是研究在这些因子的水平内或者水平间的实验响应。

例如，已知所有的决定变量因子，模型公式可以设计如下:

```R
> fm <- aov(yield ~ v + n*p*k + Error(farms/blocks), data=farm.data)
```

这常常用来描述一个同时含有均值模型 `v + n*p*k` 和三个误差层次(“农田间(between farms)”，“农田内但在区组之间(within farms, between blocks)”和“区组内(within blocks)”)的实验。

[11.4.1 方差分析表](chapter11/section11_4_1.md)