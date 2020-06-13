# 8.3 单样本和双样本检验

到现在为止，我们已经学会了单样本的正态性检验。而更常见的操作是比较两个 样本的特征。在R 里面，所有“传统”的检验都放在包stats 里面。这个包常常会自动 载入。

下面是冰融化过程的潜热(latent heat)(cal/gm ) 数据(来自Rice (1995, p.490))

```R
Method A: 79.98 80.04 80.02 80.04 80.03 80.03 80.04 79.97 80.05 80.03 80.02 80.00 80.02
Method B: 80.02 79.94 79.98 79.97 79.97 80.03 79.95 79.97
```

盒状图(boxplot)为这两组数据提供了简单的图形比较。

```R
A <- scan() 
79.98 80.04	80.02 80.04 80.03 80.03 80.04 79.97 80.05 80.03	80.02 80.00 80.02

B <- scan()
80.02	79.94	79.98 79.97 79.97 80.03 79.95 79.97 

boxplot(A, B)
```

从图上可以直观的看出第一组数据相比第二组数据倾向给出较大的值。

![images/ice](https://cran.r-project.org/doc/manuals/r-release/images/ice.png)

为了比较两个样本的均值是否相等，我们可以使用非配对 *t-*检验

```R
> t.test(A, B)

         Welch Two Sample t-test

data:  A and B
t = 3.2499, df = 12.027, p-value = 0.00694
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 0.01385526 0.07018320
sample estimates:
mean of x mean of y
 80.02077  79.97875
```

上面的结果表明在正态前提下[^1]，二者有明显的统计差异。R 函数默认两个样本方差不齐，而 SPLUS 类似函数 `t.test` 则默认方差齐性。如果两个样本都是来自正态群体，我们可以用 F 检验来确定方差的齐性情况。

```R
> var.test(A, B)

         F test to compare two variances

data:  A and B
F = 0.5837, num df = 12, denom df =  7, p-value = 0.3938
alternative hypothesis: true ratio of variances is not equal to 1
95 percent confidence interval:
 0.1251097 2.1052687
sample estimates:
ratio of variances
         0.5837405
```

这表明二者方差在统计学上没有显著差异，我们可以采用传统的假设方差齐性的 *t-*检验。

```R
> t.test(A, B, var.equal=TRUE)

         Two Sample t-test

data:  A and B
t = 3.4722, df = 19, p-value = 0.002551
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 0.01669058 0.06734788
sample estimates:
mean of x mean of y
 80.02077  79.97875
```

所有这些检验都假设了数据的正态性。双样本的Wilcoxon(或者Mann-Whitney)检验没有正态性的前提，仅仅要求在无效假设(null hypothesis)情况下样本来自一个常规的连续分布。

```R
> wilcox.test(A, B)

         Wilcoxon rank sum test with continuity correction

data:  A and B
W = 89, p-value = 0.007497
alternative hypothesis: true location shift is not equal to 0

Warning message:
Cannot compute exact p-value with ties in: wilcox.test(A, B)
```

注意警告信息：在两个样本中都有同秩现象, 这表明这些数据来自离散分布(可能由于数据的近似处理造成)。

有好多种方法可以图形化的显示两个样本的差别。我们已经看过盒状图的比较。 下面的命令

```R
> plot(ecdf(A), do.points=FALSE, verticals=TRUE, xlim=range(A, B))
> plot(ecdf(B), do.points=FALSE, verticals=TRUE, add=TRUE)
```

同时显示两个样本的经验累计概率分布，而 `qqplot` 得到的是两个样本的 Q-Q 图。Kolmogorov-Smirnov 检验是对两个经验累计概率分布间的最大垂直距离进行统计的。Kolmogorov-Smirnov 检验只假定数据服从一个常规的连续分布：

```R
> ks.test(A, B)

         Two-sample Kolmogorov-Smirnov test

data:  A and B
D = 0.5962, p-value = 0.05919
alternative hypothesis: two-sided

Warning message:
cannot compute correct p-values with ties in: ks.test(A, B)
```







---

[^1]: 译者注：t-检验有正态性假设的，所以在进行t-检验前，原则上需要做一个数据的正态性检验。

